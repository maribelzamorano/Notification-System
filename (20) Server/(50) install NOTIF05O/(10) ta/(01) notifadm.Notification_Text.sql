/*	
 * topdev GmbH, erstellt am 15.01.2010 11:00
 *
 * $Author: Renato Fontes $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (01) notifadm.IO_NOTIFICATION_TEXT.sql $
 *
 */

if exists ( select * from sysobjects where id = object_id('notifadm.IO_NOTIFICATION_TEXT') and OBJECTPROPERTY(id, 'IsTable') = 1)
begin
	GOTO createView;
--	drop table notifadm.IO_NOTIFICATION_TEXT;
end;

create table notifadm.IO_NOTIFICATION_TEXT(
	NOTX_ID				UDT_ID IDENTITY NOT FOR REPLICATION,


-->	
	SBTP_CODE			UDT_CODE	NOT NULL,
	CMMD_CODE			UDT_CODE	NOT NULL,
	NOTX_TEXT			nvarchar(max) NOT NULL,

--<			
	NOTX_USER			UDT_USER	NOT NULL,
	NOTX_PTS			UDT_PTS		NOT NULL,
	NOTX_#PTS			UDT_#PTS	NULL,	--as convert( nvarchar(23), NOTX_PTS, 121 ),
	NOTX_ID_INT			UDT_ID_0	NOT NULL,
	NOTX_UQID			UDT_UQID	NOT NULL ROWGUIDCOL,
	NOTX_KZ_FREIGABE	UDT_BOOLEAN	NOT NULL,
	NOTX_KZ_REPLIKATION	UDT_BOOLEAN	NOT NULL,
	NOTX_KZ_GELOESCHT	UDT_BOOLEAN	NOT NULL,

	CONSTRAINT PK_NOTX PRIMARY KEY CLUSTERED( NOTX_ID )
);

CREATE UNIQUE INDEX NOTX_IX_01_U ON notifadm.IO_NOTIFICATION_TEXT( NOTX_UQID );
CREATE UNIQUE INDEX NOTX_IX_O2_U ON notifadm.IO_NOTIFICATION_TEXT( SBTP_CODE, CMMD_CODE );
CREATE INDEX		NOTX_IX_02	 ON notifadm.IO_NOTIFICATION_TEXT( NOTX_KZ_GELOESCHT );

createView:

if not exists ( select * from sysobjects where id = object_id('notifadm.T_NOTIFICATION_TEXT') and OBJECTPROPERTY(id, 'IsView') = 1)
begin
	exec( N'create view notifadm.T_NOTIFICATION_TEXT as select * from INFORMATION_SCHEMA.TABLES;' );
end
GO

alter view notifadm.T_NOTIFICATION_TEXT(
		NOTX_ID,

		SBTP_CODE,
		CMMD_CODE,
		NOTX_TEXT,

		NOTX_USER,
		NOTX_PTS,
		NOTX_#PTS

) as
select	NOTX_ID,

		SBTP_CODE,
		CMMD_CODE,
		NOTX_TEXT,

		NOTX_USER,
		NOTX_PTS,
		NOTX_#PTS

from	notifadm.IO_NOTIFICATION_TEXT
where	NOTX_KZ_GELOESCHT = 0;

GO
