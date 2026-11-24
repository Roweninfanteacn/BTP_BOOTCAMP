import cds from '@sap/cds';

export default cds.service.impl(function () {

    const { Books } = this.entities;

    // ==========================================
    // LogBooks: Insert a new book record
    // ==========================================
    this.on('LogBooks', async (req) => {

        const { borrowerID, bookTitle, authorName, readDate } = req.data;

        // Validate required parameters
        if (!borrowerID || !bookTitle || !authorName || !readDate) {
            return req.reject(400, 'All fields are required.');
        }

        // Check if the book was already logged
        const existingBook = await SELECT.one.from(Books).where({
            borrowerID: borrowerID,
            bookTitle: bookTitle,
            readDate: readDate
        });

        // Prevent duplicate records
        if (existingBook) {
            return req.reject(
                409,
                'This book has already been logged by the borrower on this date.'
            );
        }

        // Insert new book record
        await INSERT.into(Books).entries({
            ID: cds.utils.uuid(),
            borrowerID: borrowerID,
            bookTitle: bookTitle,
            authorName: authorName,
            readDate: readDate
        });

        // Return success message
        return `Book "${bookTitle}" successfully logged for borrower ${borrowerID}.`;

    });


    // ==========================================
    // FetchBooks: Retrieve books by borrowerID
    // ==========================================
    this.on('FetchBooks', async (req) => {

        const { borrowerID } = req.data;

        // Validate borrowerID
        if (!borrowerID) {
            return req.reject(400, 'Borrower ID is required.');
        }

        // Retrieve books filtered by borrowerID
        // Sort by readDate in descending order
        const books = await SELECT.from(Books)
            .where({ borrowerID: borrowerID })
            .orderBy('readDate desc');

        // Validate if no records exist
        if (books.length === 0) {
            return req.reject(
                404,
                `No books found for borrower ${borrowerID}.`
            );
        }

        // Return matching book logs
        return books;

    });

});