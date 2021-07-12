/*	
 * topdev GmbH, erstellt am 10.02.2010 08:55
 *
 * $Author: Maribel Zamorano $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (01) notifadm.LogServiceGenerator.sql $
 *
 */

if exists ( select * from sysobjects where id = object_id('notifadm.IO_LOGSERVICEGENERATOR') and OBJECTPROPERTY(id, 'IsTable') = 1)
begin
	GOTO createView;
--	drop table notifadm.IO_LOGSERVICEGENERATOR;
end;

create table notifadm.IO_LOGSERVICEGENERATOR(
	LSGE_ID					UDT_ID IDENTITY NOT FOR REPLICATION,


	LSGE_STARTTIME			datetime		NOT NULL,
	LSGE_ENDTIME			datetime		NOT NULL,
	LSGE_RC					integer			NOT NULL,
	LSGE_RC_TEXT			nvarchar(255)	NULL,

			

	LSGE_USER			UDT_USER	NOT NULL,
	LSGE_PTS			UDT_PTS		NOT NULL,
	LSGE_#PTS			UDT_#PTS	NULL,	
	LSGE_ID_INT			UDT_ID_0	NOT NULL,
	LSGE_UQID			UDT_UQID	NOT NULL ROWGUIDCOL,
	LSGE_KZ_FREIGABE	UDT_BOOLEAN	NOT NULL,
	LSGE_KZ_REPLIKATION	UDT_BOOLEAN	NOT NULL,
	LSGE_KZ_GELOESCHT	UDT_BOOLEAN	NOT NULL,

	CONSTRAINT PK_LSGE PRIMARY KEY CLUSTERED( LSGE_ID )
);

CREATE UNIQUE INDEX LSGE_IX_01_U ON notifadm.IO_LOGSERVICEGENERATOR( LSGE_UQID );
CREATE INDEX		LSGE_IX_02	 ON notifadm.IO_LOGSERVICEGENERATOR( LSGE_KZ_GELOESCHT );

createView:

if not exists ( select * from sysobjects where id = object_id('notifadm.T_LOGSERVICEGENERATOR') and OBJECTPROPERTY(id, 'IsView') = 1)
begin
	exec( N'create view notifadm.T_LOGSERVICEGENERATOR as select * from INFORMATION_SCHEMA.TABLES;' );
end
GO

alter view notifadm.T_LOGSERVICEGENERATOR(
		LSGE_ID,


		LSGE_STARTTIME,
		LSGE_ENDTIME,
		LSGE_RC,
		LSGE_RC_TEXT,	

		LSGE_USER,
		LSGE_PTS,
		LSGE_#PTS

) as
select	LSGE_ID,

		LSGE_STARTTIME,
		LSGE_ENDTIME,
		LSGE_RC,
		LSGE_RC_TEXT,

		LSGE_USER,
		LSGE_PTS,
		LSGE_#PTS

from	notifadm.IO_LOGSERVICEGENERATOR
where	LSGE_KZ_GELOESCHT = 0;

GO
