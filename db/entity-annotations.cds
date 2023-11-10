using {my.bookshop as model} from './data-model';
using {my.Service as service} from '../srv/cat-service';

annotate model.Books with @(UI: {
    HeaderInfo      : {
        TypeName      : '{i18n>Bookshop}',
        TypeNamePlural: '{i18n>Books}',
        Title         : {Value: ID},
        Description   : {Value: title}
    },
    SelectionFields : [ 
        ID,
        title,
        author.name,
        category.cat_name
    ],
    LineItem        : [
        {Value: ID},
        {Value: title},
        {
            Value: author.name,
            Label: 'Author'
        },
        {
            Value: category.cat_name,
            Label: 'Category'
        },
        {Value: stock},
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'sayHi',
            Label : '{i18n>sayHi}'
        }
    ],
    Facets          : [ /* es la pagina de detalles una vez que clickeas el line item */
    {
        $Type : 'UI.CollectionFacet',
        Label : 'Book Information',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Main',
            Label : 'Book Details'
        }]
    }],
    FieldGroup #Main: {Data: [
        {Value: ID},
        {Value: title},
        {Value: author.name},
        {Value: category.cat_name},
        {Value: stock},
    ]}
});
