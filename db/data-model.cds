namespace my.bookshop;

using {
  Country,
  managed,
  cuid
} from '@sap/cds/common';

entity Books : cuid {
      @assert.notNull: true
/*       @assert.range  : [ 0, 2000 ] /* validaciones */ 
   /*   @Common.Label  : 'Book ID'
          key ID       : cuid; */
      @Common.Label  : 'Book Title'
      title    : localized String;
      author   : Association to Authors;
      category : Association to Category;
      stock    : Integer;
}

entity Authors : cuid {
/*   key ID    : Integer; */
      name  : String;
      books : Association to many Books
                on books.author = $self;
}

entity Orders : cuid, managed {
 /* key ID      : UUID; */
      book    : Association to Books;
      country : Country;

      @readonly
      amount  : Integer;
}

entity Category : cuid {
  key ID       : Integer;/*  */
      cat_name : String;
      books    : Association to many Books
                   on books.category = $self;
}

/* presionar CTRL + C para terminar el command line engorroso */
