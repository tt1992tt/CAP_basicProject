using { my.bookshop as model } from './data-model';

annotate model.Books with @(
    UI: {
        HeaderInfo: {
            TypeName: '{i18n>Bookshop}',
            TypeNamePlural: '{i18n>Books}',
            Title: { Value: ID },
            Description: { Value: title }
        },
        SelectionFields: [ ID, title, author.name ],
        LineItem: [
            { Value: ID },
            { Value: title },
            { Value: author.name }, 
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
                { Value: stock },             
            ]
        }
    }
);