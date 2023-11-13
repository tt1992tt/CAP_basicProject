const cds = require('@sap/cds');
const cors = require('cors');

cds.on('bootstrap', app => {
    app.use(cors()) 
    /* middleware CORS: permite que tu aplicación haga solicitudes a distintos recursos sin que el navegador bloquee las peticiones 
    debido a la política de "Mismo Origen" (Same-Origin Policy). */
    app.get('/health', (_, res) => { /* me aseguro que la ruta este disponible ni bien arranca la applicacion */
        res.status(200).send('OK');

            // Manejo de rutas no encontradas
    app.use((req, res) => {
        res.status(404).send('Ruta no encontrada');
        });

    })
})


module.exports = cds.server /* con esto indico que es el servidor que maneja las solicitudes HTTP del webservice */
/* en cambio con el module.exports = srv indico que es un event handler de servicios custom */