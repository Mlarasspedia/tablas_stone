# Tabla CO_OTCCL - Relación de Tipos de Contratos con Cláusulas Asociadas al Otro Sí

## Descripción General
Esta tabla maneja la relación entre tipos de contratos y las cláusulas asociadas a documentos tipo "Otro Sí" (adendas o modificaciones a contratos). 

## Estructura de la Tabla

### Campos Principales
| Campo | Tipo | Nulo | Descripción |
|-------|------|------|-------------|
| COD_EMPR | NUMERIC(5,0) | NOT NULL | Código de la empresa |
| RMT_CACT | NUMERIC(10,0) | NOT NULL | Referencia al contrato principal |
| RMT_OTRS | NUMERIC(10,0) | NOT NULL | Referencia al documento "Otro Sí" |
| ORD_PRES | NUMERIC(5,0) | NOT NULL | Orden de presentación de la cláusula |
| COD_CLAU | NUMERIC(10,0) | NOT NULL | Código de la cláusula |
| NOM_CLAU | CLOB | NOT NULL | Texto completo de la cláusula |
| CLA_MODI | CHAR(1) | NOT NULL | Indica si la cláusula es modificable (S/N) |

### Restricciones

#### Llaves Primarias y Únicas
- **Llave Primaria (COF0POTCCL)**: 
  - COD_EMPR
  - RMT_CACT
  - ORD_PRES

- **Llave Única (COU0POTCCL)**:
  - COD_EMPR
  - RMT_CACT
  - COD_CLAU

#### Llaves Foráneas
1. **COF01OTCCL**:
   - Referencias a tabla CO_CACTR
   - Campos: (COD_EMPR, RMT_CACT)
   
2. **COF02OTCCL**:
   - Referencias a tabla CO_OTRSI
   - Campos: (COD_EMPR, RMT_OTRS)
   
3. **COF03OTCCL**:
   - Referencias a tabla CO_CLAUS
   - Campos: (COD_EMPR, COD_CLAU)

#### Restricciones de Valor
- **COC01OTCCL**: Campo CLA_MODI solo puede tener valores 'S' o 'N'

## Relaciones
La tabla mantiene relaciones con:
1. **CO_CACTR**: Tabla de contratos principales
2. **CO_OTRSI**: Tabla de documentos "Otro Sí"
3. **CO_CLAUS**: Tabla maestra de cláusulas

## Propósito
1. Permite asociar cláusulas específicas a las modificaciones de contratos
2. Mantiene un orden de presentación de las cláusulas
3. Controla qué cláusulas pueden ser modificadas
4. Almacena el texto completo de cada cláusula
5. Garantiza la integridad referencial con contratos y sus modificaciones

## Consideraciones de Uso
- El campo ORD_PRES permite establecer el orden en que se presentarán las cláusulas
- CLA_MODI permite controlar qué cláusulas pueden ser modificadas posteriormente
- La unicidad de (COD_EMPR, RMT_CACT, COD_CLAU) evita duplicar cláusulas en un mismo contrato
- El campo CLOB para NOM_CLAU permite almacenar textos extensos de las cláusulas
