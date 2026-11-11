# Base de datos

Scripts versionados para PostgreSQL local o Supabase, esquema `negocio`.

Para una base nueva independiente, ejecutar primero `20261017000000_preparacion.sql` con un usuario que pueda crear esquema y roles. Después aplicar las restantes migraciones en orden de nombre con el mismo propietario. El backend debe conectarse con el propietario del esquema, tal como exige el modelo de acceso actual. No instalar en la base original ni combinar con un dump del mismo esquema.

## Contenido

- `migrations/`: estructura, restricciones, roles funcionales, permisos y procesos comerciales. Hay 28 scripts; el ajuste de unidades SUNAT tiene una numeración intermedia.
- `diagnostics/`: revisión de solo lectura del esquema y procesos instalados.

Los scripts se conservan como fuente del esquema. Para una base nueva, revisar los requisitos de cada archivo y aplicar en orden de nombre. No volver a ejecutar la instalación completa sobre una base que ya contiene las tablas. La aplicación no los ejecuta automáticamente y esta carpeta no configura por sí sola un despliegue mediante CLI.

## Datos y operaciones

No se incluyen exportaciones de usuarios, contraseñas, clientes, proveedores, existencias ni ventas reales. Los datos iniciales de las migraciones corresponden a catálogos y parámetros del sistema.

La carga de productos debe respetar categorías, unidades, presentación base y contexto de auditoría. Las existencias y costos se registran mediante apertura de inventario o ingresos de mercadería. Los movimientos de caja, saldos, pagos y auditoría se generan mediante los procesos correspondientes.

Mantener las credenciales de conexión en el archivo privado del backend. No incluirlas en scripts, documentación o código del frontend.

## Actualización de identidad visual

`20261025000100_identidad_visual.sql` agrega la tabla de configuración `negocio.identidad_visual` y cambia el nombre visible de ADM a «Administrador/a». No modifica las asignaciones de permisos. El logo es opcional; no se inserta una imagen de ejemplo. Instalar esta migración una sola vez después de las anteriores y antes de utilizar el backend con la configuración de logo/favicon.

## Actualización de imágenes de productos

`20261026000100_imagen_producto.sql` añade `negocio.producto_imagen`: una miniatura JPEG opcional por producto, hasta 64 KiB, con FK, hash y auditoría. Aplica después de identidad visual y antes de iniciar el backend actualizado. No requiere Storage ni contiene imágenes iniciales. La aplicación accede mediante el backend autenticado; se mantienen RLS y revocación de acceso directo.
