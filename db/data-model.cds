namespace my.bookshop;
using { Country, managed } from '@sap/cds/common';

entity Books {
  key ID : Integer;
  title  : localized String;
  author : Association to Authors;
  category : Association to Category;
  stock  : Integer;
}

entity Authors {
  key ID : Integer;
  name   : String;
  books  : Association to many Books on books.author = $self;
}

entity Orders : managed {
  key ID  : UUID;
  book    : Association to Books;
  country : Country; @readonly
  amount  : Integer;
}

entity Category {
  key ID : Integer;
  cat_name : String;
  books : Association to many Books on books.category = $self;
}
