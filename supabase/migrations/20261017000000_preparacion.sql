-- Instalación inicial en una base vacía. Ejecutar antes de las demás migraciones.
-- Estos roles NOLOGIN solo permiten conservar las revocaciones de seguridad existentes.
BEGIN;
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname='anon') THEN CREATE ROLE anon NOLOGIN; END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname='authenticated') THEN CREATE ROLE authenticated NOLOGIN; END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname='service_role') THEN CREATE ROLE service_role NOLOGIN; END IF;
END $$;
CREATE SCHEMA negocio;
COMMENT ON SCHEMA negocio IS 'Sistema de ventas e inventario';
REVOKE ALL ON SCHEMA negocio FROM PUBLIC, anon, authenticated, service_role;
COMMIT;
