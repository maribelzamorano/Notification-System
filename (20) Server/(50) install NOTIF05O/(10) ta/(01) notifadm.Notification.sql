/*	
 * topdev GmbH, erstellt am 15.01.2010 10:00
 *
 * $Author: Maribel Zamorano $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (01) notifadm.Notifications.sql $
 *
 */

if exists ( select * from sysobjects where id = object_id('notifadm.IO_NOTIFICATION') and OBJECTPROPERTY(id, 'IsTable') = 1)
begin
	GOTO createView;
--	drop table notifadm.IO_NOTIFICATION;
end;

create table notifadm.IO_NOTIFICATION(
	NOTF_ID				UDT_ID IDENTITY NOT FOR REPLICATION,

-->
	SBPN_ID				UDT_ID		NULL,	
	NFEV_ID				UDT_ID		NOT NULL,

-->	
	
	NOTF_INFORMATION    XML			NOT NULL,
	NOTF_ISSENT			UDT_BOOLEAN	NOT NULL,

--<			

	NOTF_USER			UDT_USER	NOT NULL,
	NOTF_PTS			UDT_PTS		NOT NULL,
	NOTF_#PTS			UDT_#PTS	NULL,	
	NOTF_ID_INT			UDT_ID_0	NOT NULL,
	NOTF_UQID			UDT_UQID	NOT NULL ROWGUIDCOL,
	NOTF_KZ_FREIGABE	UDT_BOOLEAN	NOT NULL,
	NOTF_KZ_REPLIKATION	UDT_BOOLEAN	NOT NULL,
	NOTF_KZ_GELOESCHT	UDT_BOOLEAN	NOT NULL,

	CONSTRAINT PK_NOTF PRIMARY KEY CLUSTERED( NOTF_ID )
);

CREATE UNIQUE INDEX NOTF_IX_01_U ON notifadm.IO_NOTIFICATION( NOTF_UQID );
CREATE INDEX		NOTF_IX_02	 ON notifadm.IO_NOTIFICATION( NOTF_KZ_GELOESCHT );

createView:

if not exists ( select * from sysobjects where id = object_id('notifadm.T_NOTIFICATION') and OBJECTPROPERTY(id, 'IsView') = 1)
begin
	exec( N'create view notifadm.T_NOTIFICATION as select * from INFORMATION_SCHEMA.TABLES;' );
end
GO

alter view notifadm.T_NOTIFICATION(
		NOTF_ID,

		SBPN_ID,
		NFEV_ID,
	
		NOTF_INFORMATION,
		NOTF_ISSENT,

		NOTF_USER,
		NOTF_PTS,
		NOTF_#PTS

) as
select	NOTF_ID,

		SBPN_ID,
		NFEV_ID,

		NOTF_INFORMATION,
		NOTF_ISSENT,

		NOTF_USER,
		NOTF_PTS,
		NOTF_#PTS

from	notifadm.IO_NOTIFICATION
where	NOTF_KZ_GELOESCHT = 0;

GO
