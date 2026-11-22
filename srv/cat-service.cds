using BTP_BOOTCAMP from '../db/schema';

service CatalogService {
    entity Books as projection on BTP_BOOTCAMP.Books;
    entity Products as projection on BTP_BOOTCAMP.PRODUCTS;
    entity Suppliers as projection on BTP_BOOTCAMP.SUPPLIERS;
    entity Categories as projection on BTP_BOOTCAMP.CATEGORIES;
}