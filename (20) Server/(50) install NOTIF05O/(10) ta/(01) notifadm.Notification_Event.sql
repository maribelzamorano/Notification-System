/*	
 * topdev GmbH, erstellt am 15.01.2010 10:00
 *
 * $Author: Maribel Zamorano $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (01) notifadm.Notification_Events.sql $
 *
 */

if exists ( select * from sysobjects where id = object_id('notifadm.IO_NOTIFICATION_EVENT') and OBJECTPROPERTY(id, 'IsTable') = 1)
begin
	GOTO createView;
--	drop table notifadm.IO_NOTIFICATION_EVENT;
end;

create table notifadm.IO_NOTIFICATION_EVENT(
	NFEV_ID					UDT_ID IDENTITY NOT FOR REPLICATION,

--> 
	EVTP_CODE				UDT_CODE	NOT NULL,	

-->	
	NFEV_EVENTID			UDT_ID		NOT NULL,
	USER_ID					UDT_ID		NULL,
	NFEV_EMAILCC			nvarchar(255) NULL,
	NFEV_EMAILBCC			nvarchar(255) NULL,
	NFEV_ATTACHMENT			XML			NULL,
	NFEV_INFORMATION		XML			NULL,
	NFEV_DIRECTINFORMATION	XML			NULL,
	NFEV_ISREAD			    UDT_BOOLEAN	NOT NULL,

--<			

	NFEV_USER			UDT_USER	NOT NULL,
	NFEV_PTS			UDT_PTS		NOT NULL,
	NFEV_#PTS			UDT_#PTS	NULL,	
	NFEV_ID_INT			UDT_ID_0	NOT NULL,
	NFEV_UQID			UDT_UQID	NOT NULL ROWGUIDCOL,
	NFEV_KZ_FREIGABE	UDT_BOOLEAN	NOT NULL,
	NFEV_KZ_REPLIKATION	UDT_BOOLEAN	NOT NULL,
	NFEV_KZ_GELOESCHT	UDT_BOOLEAN	NOT NULL,

	CONSTRAINT PK_NFEV PRIMARY KEY CLUSTERED( NFEV_ID )
);

CREATE UNIQUE INDEX NFEV_IX_01_U ON notifadm.IO_NOTIFICATION_EVENT( NFEV_UQID );
CREATE INDEX		NFEV_IX_02	 ON notifadm.IO_NOTIFICATION_EVENT( NFEV_KZ_GELOESCHT );

createView:

if not exists ( select * from sysobjects where id = object_id('notifadm.T_NOTIFICATION_EVENT') and OBJECTPROPERTY(id, 'IsView') = 1)
begin
	exec( N'create view notifadm.T_NOTIFICATION_EVENT as select * from INFORMATION_SCHEMA.TABLES;' );
end
GO

alter view notifadm.T_NOTIFICATION_EVENT(
		NFEV_ID,

		EVTP_CODE,
	
		NFEV_EVENTID,
		USER_ID,
		NFEV_EMAILCC,
		NFEV_EMAILBCC,
		NFEV_ATTACHMENT,
		NFEV_INFORMATION,
		NFEV_DIRECTINFORMATION,
		NFEV_ISREAD,

		NFEV_USER,
		NFEV_PTS,
		NFEV_#PTS

) as
select	NFEV_ID,

		EVTP_CODE,

		NFEV_EVENTID,
		USER_ID,
		NFEV_EMAILCC,
		NFEV_EMAILBCC,
		NFEV_ATTACHMENT,
		NFEV_INFORMATION,
		NFEV_DIRECTINFORMATION,
		NFEV_ISREAD,

		NFEV_USER,
		NFEV_PTS,
		NFEV_#PTS

from	notifadm.IO_NOTIFICATION_EVENT
where	NFEV_KZ_GELOESCHT = 0;

GO
