using my.bookshop as my from '../db/data-model';
namespace my.Service;

service CatalogService {
  @odata.draft.enabled
  entity Books              as projection on my.Books;
  entity Authors @readonly  as projection on my.Authors;
  entity Category @readonly as projection on my.Category;
  entity Orders             as projection on my.Orders;
  function currentTime(usr : String) returns String;
  /* funciones son para lectura (GET) y acciones para escritura (POST) */
  action sayHi() returns String;
};

