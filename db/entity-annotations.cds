using { my.bookshop as model } from './data-model';

annotate model.Books with @(
    UI: {
        HeaderInfo: {
            TypeName: '{i18n>Bookshop}',
            TypeNamePlural: '{i18n>Books}',
            Title: { Value: ID },
            Description: { Value: title }
        },
        SelectionFields: [ ID, title, author.name, category.cat_name ],
        LineItem: [
            { Value: ID },
            { Value: title },
            { Value: author.name, Label: 'Author' },
            { Value: category.cat_name, Label: 'Category'}, 
            { Value: stock },           
        ],
        Facets: [  /* es la pagina de detalles una vez que clickeas el line item */
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Book Information',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Book Details'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: ID },
                { Value: title },
                { Value: author_ID },
                { Value: category_ID},
                { Value: stock },             
            ]
        }
    }
);

annotate model.Orders with @(
    UI: {
        HeaderInfo: {
            TypeName: '{i18n>Orders}',
            TypeNamePlural: '{i18n>Orders}',
            Title: { Value: ID },
            Description: { Value: book_ID } 
        },
        SelectionFields: [ ID, book_ID, amount ],
        LineItem: [
            { Value: ID },
            { Value: book_ID, Label: '{i18n>Book}' }, 
            { Value: amount, Label: '{i18n>Amount}' }, 
            { Value: country_code, Label: '{i18n>Country}' },           
        ],
        Facets: [  /* es la pagina de detalles una vez que clickeas el line item */
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Order Information',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Order Details'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: ID },
                { Value: book_ID, Label: '{i18n>Book}' },
                { Value: amount, Label: '{i18n>Amount}' },
                { Value: country_code, Label: '{i18n>Country}' },            
            ]
        }
    }
);