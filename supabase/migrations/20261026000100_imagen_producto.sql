BEGIN;
SELECT set_config('app.usuario','MIGRACION_IMAGEN_PRODUCTO',true),set_config('app.equipo','SQL_EDITOR',true);
CREATE TABLE negocio.producto_imagen (
 id_producto bigint PRIMARY KEY REFERENCES negocio.producto(id_producto) ON DELETE RESTRICT,
 imagen_jpeg bytea CHECK(octet_length(imagen_jpeg) BETWEEN 1 AND 65536),
 sha256 varchar(64) CHECK(sha256 ~ '^[0-9a-f]{64}$'),
 usucre varchar(100) NOT NULL,pccre varchar(100) NOT NULL,
 feccre timestamp NOT NULL DEFAULT timezone('America/Lima',now()),usmod varchar(100),pcmod varchar(100),fecmod timestamp,
 CHECK((imagen_jpeg IS NULL)=(sha256 IS NULL))
);
COMMENT ON TABLE negocio.producto_imagen IS 'Una miniatura JPEG normalizada de hasta 64 KiB por producto. No almacena originales.';
ALTER TABLE negocio.producto_imagen ENABLE ROW LEVEL SECURITY;
REVOKE ALL ON TABLE negocio.producto_imagen FROM PUBLIC,anon,authenticated,service_role;
CREATE TRIGGER auditoria BEFORE INSERT OR UPDATE ON negocio.producto_imagen FOR EACH ROW EXECUTE FUNCTION negocio.completar_auditoria();
CREATE TRIGGER no_delete BEFORE DELETE ON negocio.producto_imagen FOR EACH ROW EXECUTE FUNCTION negocio.rechazar_mutacion();
CREATE TRIGGER no_truncate BEFORE TRUNCATE ON negocio.producto_imagen FOR EACH STATEMENT EXECUTE FUNCTION negocio.rechazar_mutacion();
COMMIT;
