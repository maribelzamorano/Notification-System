/*	
 * topdev GmbH, erstellt am 15.01.2010 11:00
 *
 * $Author: Renato Fontes $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (01) notifadm.IO_DEVICE.sql $
 *
 */

if exists ( select * from sysobjects where id = object_id('notifadm.IO_DEVICE') and OBJECTPROPERTY(id, 'IsTable') = 1)
begin
	GOTO createView;
--	drop table notifadm.IO_DEVICE;
end;

create table notifadm.IO_DEVICE(
	DEVC_ID				UDT_ID IDENTITY NOT FOR REPLICATION,

	SBER_ID				UDT_ID		NOT NULL,
	CMMD_CODE			UDT_CODE	NOT NULL,

	DEVC_ADDRESS		nvarchar(255)NOT NULL,
		
	DEVC_USER			UDT_USER	NOT NULL,
	DEVC_PTS			UDT_PTS		NOT NULL,
	DEVC_#PTS			UDT_#PTS	NULL,	
	DEVC_ID_INT			UDT_ID_0	NOT NULL,
	DEVC_UQID			UDT_UQID	NOT NULL ROWGUIDCOL,
	DEVC_KZ_FREIGABE	UDT_BOOLEAN	NOT NULL,
	DEVC_KZ_REPLIKATION	UDT_BOOLEAN	NOT NULL,
	DEVC_KZ_GELOESCHT	UDT_BOOLEAN	NOT NULL,

	CONSTRAINT PK_DEVC PRIMARY KEY CLUSTERED( DEVC_ID )
);

CREATE UNIQUE INDEX DEVC_IX_01_U ON notifadm.IO_DEVICE( DEVC_UQID );
CREATE INDEX		DEVC_IX_02	 ON notifadm.IO_DEVICE( DEVC_KZ_GELOESCHT );

createView:

if not exists ( select * from sysobjects where id = object_id('notifadm.T_DEVICE') and OBJECTPROPERTY(id, 'IsView') = 1)
begin
	exec( N'create view notifadm.T_DEVICE as select * from INFORMATION_SCHEMA.TABLES;' );
end
GO

alter view notifadm.T_DEVICE(
		DEVC_ID,

		SBER_ID,
		CMMD_CODE,

		DEVC_ADDRESS,

		DEVC_USER,
		DEVC_PTS,
		DEVC_#PTS

) as
select	DEVC_ID,

		SBER_ID,
		CMMD_CODE,

		DEVC_ADDRESS,

		DEVC_USER,
		DEVC_PTS,
		DEVC_#PTS

from	notifadm.IO_DEVICE
where	DEVC_KZ_GELOESCHT = 0;

GO
