# Base de ventas e inventario

Aplicación independiente para adaptar a distintos negocios. Conserva las pantallas, navegación, componentes, temas y lógica de ventas e inventario de la aplicación de origen.

- Frontend: Angular 22 y Angular Material.
- Backend: Java 21 y Spring Boot 3.4.5, paquete `com.ventas`.
- Base de datos: PostgreSQL, esquema `negocio`. Las migraciones se encuentran en `supabase/migrations` y también pueden instalarse en PostgreSQL local.

La identidad visible inicial es **Mi negocio**. Nombre, logo y datos comerciales se configuran en la aplicación. No se incluyen categorías, productos, usuarios, ventas, credenciales ni conexiones del negocio original. Se conservan los catálogos de permisos, unidades y parámetros operativos. Las reglas tributarias actuales siguen orientadas a Perú.

Consultar `frontend/README.md`, `backend/README.md`, `supabase/README.md` y `DESPLIEGUE.md` para ejecutar la aplicación. Cada copia debe utilizar su propia base de datos y credenciales.

La integración tributaria real y las pruebas físicas de impresión siguen pendientes.

Para reutilizar la base mediante selección autónoma de módulos o integración dirigida, consultar [Guía fija de adaptación](GUIA_DE_ADAPTACION.md). La apariencia puede conservarse o adaptarse; añadir temas nuevos requiere una petición expresa.
