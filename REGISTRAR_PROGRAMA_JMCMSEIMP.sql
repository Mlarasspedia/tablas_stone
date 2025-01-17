DELETE GN_PERMI WHERE COD_PROG = 'JCMSEIMP'            
DELETE CV_CATPR WHERE COD_PROG = 'JCMSEIMP'
--DELETE CV_CATAL WHERE COD_CATA = 'CM_SERVI'
DELETE CV_VEPRO WHERE COD_PROG = 'JCMSEIMP'
DELETE GN_AUIIN WHERE COD_PROG = 'JCMSEIMP'
DELETE GN_PROGR WHERE COD_PROG = 'JCMSEIMP'
DELETE GN_GMENU WHERE COD_PROG = 'JCMSEIMP'

--SELECT * FROM CV_CATPR WHERE COD_CATA='CM_SERVI'

--- dAME UN MOMENTO , ES QUE ESA RUTA ES DE PRUEBAS LA QUE VEO AQUI 
--\\172.19.52.24\apperpstone\Stone\Gadm\CM\BIN  ESTA ES PRODUCCIÓN 
-- PRUEBAS ES ESTA J:\STONE\GAdm\Cm\Bin\JCMSERVI.exe

INSERT INTO GN_PROGR (COD_PROG,NOM_PROG,COD_MODU,NOM_FISI,BMP_FISI,PAR_PROG,PRG_PROP,NOM_WEB,
 PAR_WEB,ACT_USUA,ACT_HORA,ACT_ESTA,IND_TWEB)
 VALUES
 ('JCMSEIMP','Asignación de Impuestos en Servicios',13,'\\172.19.52.24\apperpstone\Stone\Gadm\CM\BIN\JCMSERVI.exe',NULL,
 'I CM JCMSEIMP "GESTION ADMINISTRATIVA - COMPRAS - SERVICIOS - Asignación de Impuestos"',
 'S','\\172.19.52.24\apperpstone\Stone\Gadm\CM\BIN\JCMSERVI.exe',
 '','STONE',GETDATE(),'M','N')

BEGIN TRAN
UPDATE GN_PROGR SET PAR_PROG='I CM JCMSEIMP "GESTION ADMINISTRATIVA - COMPRAS - SERVICIOS - Asignación de Impuestos"' WHERE COD_PROG='JCMSEIMP'
COMMIT

INSERT INTO CV_VEPRO 
(COD_PROG,COD_VERS,FEC_VERS,EST_PROG,COD_RECU,VER_PROG,NRO_ACTU,
ACT_USUA,ACT_HORA,ACT_ESTA)
VALUES('JCMSEIMP',16,GETDATE(),'D',1,1,1,'STONE',GETDATE(),'A')


--INSERT INTO CV_CATAL VALUES('CM_SERVI','CM_SERVI','TABLA','U',GETDATE(),'N','N','N','N','N','STONE',GETDATE(),'A')

INSERT INTO CV_CATPR VALUES('JCMSEIMP','CM_SERVI','S','S','S','S','STONE',GETDATE(),'A','M')

INSERT INTO GN_PERMI VALUES('STONE','JCMSEIMP','S','S','S','S','S','STONE',GETDATE(),'A')


INSERT INTO GN_GMENU VALUES(1,'21010061','Asignación de Impuestos en Servicios','21010','JCMSEIMP','0',0,'STONE',GETDATE(),'A')
--Consulta de Módulo
--select * from GN_MODUL where INI_MODU = 'CM'

--Verificación Nuevo Programa
SELECT * FROM GN_PROGR WHERE COD_PROG = 'JCMSEIMP'
SELECT * FROM CV_VEPRO WHERE COD_PROG = 'JCMSEIMP'
SELECT * FROM CV_CATAL WHERE COD_CATA = 'CM_SERVI'
SELECT * FROM CV_CATPR WHERE COD_PROG = 'JCMSEIMP'
SELECT * FROM GN_PERMI WHERE COD_PROG = 'JCMSEIMP'
SELECT * FROM GN_GMENU WHERE COD_PROG LIKE 'JCMSEIMP%'
SELECT * FROM GN_GMENU WHERE COD_nodo LIKE '21010' and cod_gusu=1


select c.cod_cata,c.nom_cata,c.cat_tipo,o.name,o.type  from cv_catal c 
left outer join sysobjects o    on o.type = c.cat_tipo and       o.name = c.cod_cata  
inner join cv_catpr p    on (p.cod_prog = 'JCMSEIMP') and        p.cod_cata = c.cod_cata  
union  
select c.cod_cata,c.nom_cata,c.cat_tipo,o.name,o.type  from cv_catal c 
left outer join sysobjects o    on substring(o.type,1,1) = substring(c.cat_tipo,1,1) 
and       o.name = c.cod_cata   inner join cv_catpr p     on (p.cod_prog = 'JCMSEIMP') 
and         p.cod_cata = c.cod_ante  order by c.cat_tipo,c.cod_cata









