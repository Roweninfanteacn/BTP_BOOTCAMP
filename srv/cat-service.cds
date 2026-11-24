using BTP_BOOTCAMP from '../db/schema';

service CatalogService {
    entity Books as projection on BTP_BOOTCAMP.Books;
    entity Products as projection on BTP_BOOTCAMP.PRODUCTS;
    entity Suppliers as projection on BTP_BOOTCAMP.SUPPLIERS;
    entity Categories as projection on BTP_BOOTCAMP.CATEGORIES;

    action LogBooks(
        borrowerID : String(50),
        bookTitle  : String(100),
        authorName : String(100),
        readDate   : Date
    ) returns String;

    function FetchBooks(
        borrowerID : String(50)
    ) returns many Books;
}