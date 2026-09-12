# RetailPro — Proyecto de Análisis de Datos

Proyecto integrador del curso de Análisis de Datos, desarrollado sobre
un caso de negocio de retail tecnológico (TechStore / RetailPro).

## Herramientas utilizadas
- SQL Server (motor de base de datos, `Ventas_Tech_DB`)
- Power BI Desktop (Power Query, modelado de datos, DAX)
- GitHub (control de versiones y entrega)

## Estructura del repositorio
- `/3Pre-entrega`: scripts SQL y archivos de Power BI de cada módulo del proyecto.
  - `ventas_tech_db.sql` — creación de la base de datos y carga de datos (M3).
  - `m4_consultas_negocio.sql` — consultas de agregación (COUNT, SUM, AVG, MIN, MAX) sobre ventas (M4).
  - `m5_consultas_joins.sql` — consultas con JOINs y UNION ALL para enriquecer la vista de ventas (M5).
  - `Pipeline_ETL_Pintos_Cecilia.pbix` — pipeline de limpieza en Power Query (M6).
  - `Pintos_Cecilia_Checkpoint2.pbix` — modelo de datos con relaciones, tabla de calendario y medidas DAX (M8).

## Estado del proyecto
- ✅ M3 — Base de datos `Ventas_Tech_DB` creada con datos reales.
- ✅ M4 — Consultas de negocio (resumen mensual, ranking de productos, clientes recurrentes, comparación contra el promedio).
- ✅ M5 — Consultas con JOINs (vista base, clientes/productos sin ventas, consolidado por canal).
- ✅ M6 — Pipeline ETL en Power Query (limpieza de duplicados y nulos, tipado, nomenclatura Dim_/Fact_).
- ✅ M8 — Modelo de datos en esquema estrella con relaciones 1:N activas y 5 medidas DAX core.
- ⏳ Próximos pasos: dashboard completo en Power BI (M11, proyecto integrador).

## Cómo ejecutar los scripts SQL
1. Abrir SQL Server Management Studio (SSMS) y conectarse a una instancia de SQL Server.
2. Ejecutar primero `ventas_tech_db.sql` — este script crea las tablas (`categorias`, `clientes`, `productos`, `ventas`) y carga los datos de ejemplo. **Es un requisito para que los demás scripts funcionen**, ya que dependen de que estas tablas existan.
3. Con la base `Ventas_Tech_DB` ya creada, ejecutar `m4_consultas_negocio.sql` para las consultas de agregación.
4. Ejecutar `m5_consultas_joins.sql` para las consultas con JOINs y UNION ALL.

## Cómo abrir los archivos de Power BI
1. Abrir `Pipeline_ETL_Pintos_Cecilia.pbix` en Power BI Desktop para ver el pipeline de limpieza en Power Query.
2. Abrir `Pintos_Cecilia_Checkpoint2.pbix` para ver el modelo de datos con relaciones y las medidas DAX (`Total Ventas`, `Ventas Online`, `Ventas YTD`, `Ventas LY`, `% Crecimiento Anual`).
