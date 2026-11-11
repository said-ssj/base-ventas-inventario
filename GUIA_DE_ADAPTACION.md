# Guía fija de adaptación e integración

## 1. Propósito y alcance

Esta base permite reutilizar un sistema de ventas e inventario en otros proyectos. Se debe aprovechar la implementación existente de frontend, backend y PostgreSQL, conservando las reglas de negocio que correspondan a la petición.

El sistema es una base adaptable. No se debe afirmar que cubre automáticamente cualquier negocio. Antes de integrar, comparar sus capacidades con los requisitos del proyecto de destino y señalar las diferencias.

Las instrucciones expresas del usuario definen el alcance. Este archivo orienta la integración y no autoriza modificar otros proyectos, publicar servicios ni copiar datos privados fuera de lo solicitado.

## 2. Dos formas de integrar la base

### Forma A. Selección autónoma según la petición

Aplicar cuando el usuario pida analizar un proyecto y elegir por cuenta propia qué partes de esta base convienen. Ejemplos de activación:

> Revisa este proyecto y utiliza las secciones de la base que mejor se adapten a lo que necesito.

> Quiero un sistema para una tienda de repuestos. Selecciona e integra lo que corresponda de esta base.

Procedimiento:

1. Leer los requisitos disponibles y revisar el proyecto de destino. Si existe un informe, comparar sus requisitos con el código real.
2. Identificar qué capacidades ya tiene el proyecto para evitar duplicarlas.
3. Seleccionar los módulos útiles, sus dependencias y las adaptaciones necesarias.
4. Mostrar una evaluación breve con los estados definidos en la sección 3.
5. Si la petición autoriza implementar, continuar con las partes adecuadas y las adaptaciones comprendidas en el alcance. Una petición de análisis por sí sola no autoriza implementarlas.
6. Consultar únicamente las decisiones que cambien sustancialmente el alcance o dependan de información indispensable que no esté disponible. Continuar con el trabajo independiente que sí esté definido.

No incorporar un módulo únicamente porque exista en la base. Su inclusión debe responder a una necesidad del proyecto o a una dependencia necesaria y explicada.

### Forma B. Integración dirigida, por partes o en conjunto

Aplicar cuando el usuario indique expresamente qué módulos quiere integrar. Ejemplos de activación:

> Integra únicamente productos, categorías y presentaciones.

> Integra caja y punto de venta junto con sus dependencias.

> Integra toda la lógica de negocio de la base en este proyecto.

Procedimiento:

1. Delimitar los módulos solicitados y revisar qué existe en el destino.
2. Identificar las dependencias mínimas necesarias para que funcionen.
3. Evaluar la adecuación con los estados de la sección 3.
4. Integrar las partes solicitadas, conectando sus capas cuando el alcance lo requiera. No presentar una pantalla con botones sin conexión como un módulo terminado.
5. Si se pide una integración por etapas, terminar y verificar la etapa actual antes de continuar con la siguiente.
6. Si se pide el conjunto completo, coordinar las dependencias y verificar también los flujos que atraviesan varios módulos.

**“Todo” o “completo” se refiere a las capacidades existentes de la base dentro del alcance pedido. No incluye por sí solo un rediseño, temas nuevos, funciones nuevas del sector ni la implementación de una integración tributaria pendiente.**

## 3. Cómo señalar si una integración es adecuada

Usar estos estados con una explicación concreta. La evaluación debe referirse a los requisitos y al código revisado.

| Estado | Cuándo corresponde | Qué debe indicarse |
|---|---|---|
| **ADECUADO** | El módulo cubre la necesidad y sus reglas son compatibles con el destino. | Qué se reutiliza y cuáles son sus dependencias. |
| **ADECUADO CON ADAPTACIONES** | La base es útil, pero necesita cambios identificables en datos, reglas, permisos, contratos o interfaz. | Qué se conserva, qué cambia y cómo se comprobará. |
| **NO ADECUADO EN SU ESTADO ACTUAL** | La integración directa produciría resultados incorrectos o el modelo no representa el proceso requerido. | La incompatibilidad, su consecuencia y la alternativa viable. |
| **PENDIENTE DE INFORMACIÓN** | Falta una decisión o dato indispensable para determinar la compatibilidad. | El dato concreto que falta y qué trabajo sí puede adelantarse. |

Mensaje recomendado:

> **[ESTADO] — [Módulo].** Se ajusta / requiere cambios / no se ajusta porque [motivo]. Se reutilizará [parte]. Falta adaptar o definir [parte]. Depende de [módulos]. Se comprobará mediante [verificación].

Ejemplos:

- **ADECUADO — Categorías y productos.** Permite clasificar el catálogo del nuevo negocio. Se conservarán las validaciones y se configurarán sus propias categorías y unidades.
- **ADECUADO CON ADAPTACIONES — Inventario de una panadería.** Los movimientos de stock son reutilizables. Si se exige producción con recetas, consumo de ingredientes y vencimientos, se debe comprobar esa cobertura y desarrollar lo que falte.
- **NO ADECUADO EN SU ESTADO ACTUAL — Venta de joyas por peso y cotización variable del metal.** No basta con cambiar los nombres de productos. Si esos requisitos existen, se necesita adaptar el modelo de valoración antes de integrar ese flujo.

No ocultar una incompatibilidad con cambios de etiquetas ni describir como implementada una capacidad que solo tiene una pantalla o una propuesta.

## 4. Apariencia y temas opcionales

### Apariencia

La lógica de negocio y su presentación se pueden adaptar por separado.

- Si se pide conservar la apariencia de esta base, mantener distribución, navegación, posición de controles, campos, mensajes de ayuda, estados y comportamiento visual. Ajustar la identidad y los textos específicos del nuevo negocio.
- Si el destino ya tiene una interfaz y no se solicita reemplazarla, respetar su diseño e integrar la lógica a sus componentes.
- Si se pide otra apariencia, reutilizar servicios, contratos, validaciones, permisos y procesos. Adaptar los componentes visuales sin trasladar innecesariamente los estilos anteriores.
- Si se pide solo backend o BD, no incorporar el frontend.
- Si la petición no aclara el diseño y es necesario elegirlo para continuar, explicar la elección prevista o solicitar esa preferencia cuando cambie materialmente el trabajo.

Un cambio visual debe conservar la información que necesita el usuario, el acceso a las acciones autorizadas, la navegación por teclado, el foco visible, los estados de error y la legibilidad. No cambiar el modelo de negocio únicamente para acomodarlo a una composición visual.

### Temas visuales

**Añadir temas nuevos es opcional y solo se hace cuando se solicita expresamente. Pedir “integrar todo” no incluye crear paletas adicionales ni ampliar el selector de temas.**

Los temas que ya existen forman parte del frontend de esta base. Si se copia ese frontend completo conservando su apariencia, mantenerlos salvo que se indique otra cosa. Si se integra la lógica en una interfaz diferente, no es obligatorio trasladar ese catálogo de temas.

Cuando se solicite un tema nuevo, aplicarlo de forma coherente a superficies, navegación, texto, formularios, botones, tablas, mensajes, foco y estados. Comprobar la legibilidad de sus combinaciones reales. No afirmar una certificación de accesibilidad únicamente por los colores elegidos.

## 5. Partes reutilizables y dependencias

La siguiente tabla orienta la selección. Revisar siempre las dependencias efectivas en el código y en SQL antes de trasladar una parte.

| Parte | Capacidades principales | Dependencias que deben revisarse |
|---|---|---|
| Seguridad | Inicio de sesión, sesiones, usuarios, roles y permisos | Identidad del actor, autorización y auditoría |
| Catálogo | Categorías, unidades, productos, presentaciones, códigos e imágenes | Magnitudes, conversiones, precios y validaciones |
| Personas | Clientes y proveedores | Identificación, validaciones y reglas del destino |
| Compras | Órdenes de compra e ingresos de mercadería | Proveedores, catálogo, costos y movimientos de inventario |
| Inventario | Existencias, apertura, movimientos, ajustes, conteos y transformaciones | Unidades, presentaciones, costos, permisos y auditoría |
| Caja | Apertura, movimientos, cierre e historial | Usuario responsable, medios de pago y operaciones relacionadas |
| Ventas | Punto de venta, historial, pagos y comprobantes | Catálogo, precios, stock, caja, cliente, series y permisos |
| Cotizaciones y ofertas | Presupuestos, conversión y promociones | Catálogo, vigencias, cálculo de precios y ventas |
| Crédito | Cuentas por cobrar y abonos | Clientes, ventas, saldos y movimientos de caja |
| Despachos | Preparación y entrega | Venta, estado de entrega, existencias y permisos |
| Devoluciones y anulaciones | Solicitud, aprobación, rechazo y reversión | Venta original, cantidades, costo histórico, stock, caja o crédito |
| Reportes | Indicadores, gráficos y descargas | Definiciones de cálculo, permisos y datos operativos |
| Configuración e identidad | Datos comerciales, logo, series, impresión y etiquetas | Parámetros, formatos y permisos de administración |

Los nombres y funciones de los roles se ajustan al negocio. No asignar permisos administrativos a todos los usuarios para simplificar una integración. Los controles del servidor siguen siendo necesarios aunque una acción esté oculta en la interfaz.

## 6. Reglas para trasladar código y base de datos

1. Trabajar en una copia o proyecto de destino independiente. Conservar esta plantilla como fuente reutilizable.
2. Inspeccionar las versiones y la arquitectura del destino. La base usa Angular y Angular Material, Java con Spring Boot y PostgreSQL. Si el destino emplea otras tecnologías, distinguir entre adaptar las reglas y copiar directamente el código.
3. Mantener coherencia entre rutas, modelos, contratos HTTP, tipos, repositorios, esquema y funciones SQL.
4. Preservar restricciones, claves foráneas, precisión decimal, conversiones, costos históricos, auditoría, transacciones, bloqueos y protección ante reintentos. Revisar expresamente los procesos que se modifiquen.
5. No sustituir las funciones comerciales por escrituras directas que omitan sus validaciones o movimientos relacionados.
6. Utilizar credenciales, base de datos y configuración propias del destino. No copiar usuarios reales, contraseñas, clientes, ventas, existencias, logos ni conexiones de otro negocio.
7. Separar los datos iniciales necesarios del sistema de los datos comerciales. Crear el administrador mediante el mecanismo previsto y configurar categorías y productos para el nuevo negocio.
8. Para una instalación completa en una base nueva, aplicar `supabase/migrations` en orden de nombre, comenzando por `20261017000000_preparacion.sql`. El esquema de esta plantilla se llama `negocio`. Leer los requisitos del instalador y usar el propietario correspondiente.
9. Para integrar solo algunos módulos, revisar y extraer sus dependencias SQL. Los archivos existentes no constituyen paquetes independientes por pantalla. No ejecutar una selección arbitraria de migraciones ni instalar todo el esquema sin necesidad.
10. Si el destino ya contiene tablas o datos, preparar una migración específica y revisar las colisiones. No ejecutar el instalador completo ni restaurar un dump encima de esa base sin un plan de compatibilidad.
11. Elegir una fuente de instalación coherente. No combinar el dump de un esquema con las migraciones que vuelven a crear esos mismos objetos.
12. Si se renombran paquetes o esquema, actualizar todas las referencias y verificar la integración. Cambiar solo el nombre de una carpeta no adapta el sistema.

## 7. Límites que deben mantenerse visibles

- Las reglas actuales de moneda, documentos, IGV y unidades SUNAT están orientadas a Perú. Adaptarlas expresamente si el destino tiene otra jurisdicción o reglas comerciales distintas.
- La existencia de boleta, factura o XML de prueba no implica emisión electrónica real. La firma, validación y comunicación con la autoridad tributaria requieren su propia implementación y verificación.
- No afirmar que la impresión física o un lector concreto fueron comprobados si solo se revisó una vista previa o una simulación.
- No prometer capacidades sectoriales que no se hayan verificado, como recetas, lotes con vencimiento, mesas, reservas, valoración de metales o trazabilidad especializada.
- Los cambios de apariencia no eliminan estos límites ni sustituyen la validación de los procesos.

## 8. Comprobación y entrega

Al terminar la integración solicitada:

1. Compilar las capas modificadas y ejecutar las pruebas pertinentes.
2. Verificar el flujo completo solicitado, incluidos permisos, validaciones, errores y estados vacíos.
3. Si se modifica SQL, comprobar la instalación o migración en una base independiente. Probar los procesos afectados, sus efectos relacionados y los reintentos o conflictos cuando corresponda.
4. Si se modifica la apariencia, revisar las pantallas y tamaños afectados. Si se pidió conservarla, comprobar que no se alteraron controles, textos ni distribución fuera del alcance.
5. Informar qué módulos se integraron, cuáles se adaptaron, qué se excluyó y por qué, qué pruebas se ejecutaron y qué queda pendiente.

Si una verificación no pudo ejecutarse, decirlo expresamente. No declarar la integración completa si queda una dependencia indispensable o una acción principal sin conectar.

## 9. Mensajes de ejemplo para utilizar esta guía

### Selección autónoma

> Lee `GUIA_DE_ADAPTACION.md` y revisa los requisitos de este proyecto de [negocio]. Elige las partes de la base que mejor se adapten, señala su adecuación y realiza la integración autorizada. Conserva la apariencia del proyecto de destino. No añadas temas nuevos.

### Integración por partes

> Lee `GUIA_DE_ADAPTACION.md`. Integra únicamente [módulos] con las dependencias mínimas necesarias. Explica las adaptaciones y verifica el flujo conectado. Conserva la distribución visual de la base en las pantallas que se incorporen.

### Integración conjunta

> Lee `GUIA_DE_ADAPTACION.md`. Integra toda la lógica de negocio existente en una copia independiente para [negocio]. Conserva el frontend completo y personaliza su identidad. Señala las capacidades que requieran adaptación. No añadas temas nuevos ni funciones sectoriales que no haya solicitado.

### Lógica con otra apariencia

> Lee `GUIA_DE_ADAPTACION.md`. Reutiliza [módulos] y sus reglas, pero adapta las pantallas a [diseño o referencia]. Conserva permisos, validaciones, estados y flujos. No traslades el catálogo de temas anterior ni crees otros salvo que lo pida.

### Tema adicional solicitado expresamente

> Además de la integración indicada, añade el tema [nombre o paleta] y comprueba sus estados y legibilidad en las pantallas afectadas.
