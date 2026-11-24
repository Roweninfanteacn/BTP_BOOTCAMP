namespace BTP_BOOTCAMP;

entity Books {
    key ID          : UUID;
        borrowerID  : String(50);
        BorrowerName: String(50);
        bookTitle   : String(100);
        authorName  : String(100);
        readDate    : Date;
}

entity PRODUCTS {
    key ProductID       : UUID;
        ProductName     : String(100);
        SupplierID      : String(100);
        CategoryID      : String(100);
        QuantityPerUnit : String(100);
        UnitPrice       : String(100);
        UnitsInStock    : Integer;
        UnitsOnOrder    : Integer;
        ReorderLevel    : Integer;
        Discontinued    : String(100);
}

entity SUPPLIERS {
    key SupplierID  : UUID;
        CompanyName : String(100);
        ContactName : String(100);
        ContactTitle: String(100);
        Address     : String(100);
        City        : String(100);
        Region      : String(100);
        PostalCode  : String(100);
        Country     : String(100);
        Phone       : String(100);
        Fax         : Integer;
        HomePage    : String(200);
}

entity CATEGORIES {
    key CategoryID   : String; 
        CategoryName : String;
        Description  : String;
}