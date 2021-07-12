/*	
 * topdev GmbH, erstellt am 10.02.2010 09:01
 *
 * $Author: Maribel Zamorano $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (01) notifadm.LogServiceDistributor.sql $
 *
 */

if exists ( select * from sysobjects where id = object_id('notifadm.IO_LOGSERVICEDISTRIBUTOR') and OBJECTPROPERTY(id, 'IsTable') = 1)
begin
	GOTO createView;
--	drop table notifadm.IO_LOGSERVICEDISTRIBUTOR;
end;

create table notifadm.IO_LOGSERVICEDISTRIBUTOR(
	LSDI_ID					UDT_ID IDENTITY NOT FOR REPLICATION,


	LSDI_STARTTIME			datetime		NOT NULL,
	LSDI_ENDTIME			datetime		NOT NULL,
	LSDI_RC					integer			NOT NULL,
	LSDI_RC_TEXT			nvarchar(255)	NULL,

			

	LSDI_USER				UDT_USER	NOT NULL,
	LSDI_PTS				UDT_PTS		NOT NULL,
	LSDI_#PTS				UDT_#PTS	NULL,	
	LSDI_ID_INT				UDT_ID_0	NOT NULL,
	LSDI_UQID				UDT_UQID	NOT NULL ROWGUIDCOL,
	LSDI_KZ_FREIGABE		UDT_BOOLEAN	NOT NULL,
	LSDI_KZ_REPLIKATION		UDT_BOOLEAN	NOT NULL,
	LSDI_KZ_GELOESCHT		UDT_BOOLEAN	NOT NULL,

	CONSTRAINT PK_LSDI PRIMARY KEY CLUSTERED( LSDI_ID )
);

CREATE UNIQUE INDEX LSDI_IX_01_U ON notifadm.IO_LOGSERVICEDISTRIBUTOR( LSDI_UQID );
CREATE INDEX		LSDI_IX_02	 ON notifadm.IO_LOGSERVICEDISTRIBUTOR( LSDI_KZ_GELOESCHT );

createView:

if not exists ( select * from sysobjects where id = object_id('notifadm.T_LOGSERVICEDISTRIBUTOR') and OBJECTPROPERTY(id, 'IsView') = 1)
begin
	exec( N'create view notifadm.T_LOGSERVICEDISTRIBUTOR as select * from INFORMATION_SCHEMA.TABLES;' );
end
GO

alter view notifadm.T_LOGSERVICEDISTRIBUTOR(
		LSDI_ID,


		LSDI_STARTTIME,
		LSDI_ENDTIME,
		LSDI_RC,
		LSDI_RC_TEXT,	

		LSDI_USER,
		LSDI_PTS,
		LSDI_#PTS

) as
select	LSDI_ID,

		LSDI_STARTTIME,
		LSDI_ENDTIME,
		LSDI_RC,
		LSDI_RC_TEXT,

		LSDI_USER,
		LSDI_PTS,
		LSDI_#PTS

from	notifadm.IO_LOGSERVICEDISTRIBUTOR
where	LSDI_KZ_GELOESCHT = 0;

GO
