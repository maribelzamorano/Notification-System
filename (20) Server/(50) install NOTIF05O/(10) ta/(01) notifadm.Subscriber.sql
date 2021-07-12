/*	
 * topdev GmbH, erstellt am 15.01.2010 11:00
 *
 * $Author: Renato Fontes $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (01) notifadm.IO_SUBSCRIBER.sql $
 *
 */

if exists ( select * from sysobjects where id = object_id('notifadm.IO_SUBSCRIBER') and OBJECTPROPERTY(id, 'IsTable') = 1)
begin
	GOTO createView;
--	drop table notifadm.IO_SUBSCRIBER;
end;

create table notifadm.IO_SUBSCRIBER(
	SBER_ID				UDT_ID		IDENTITY NOT FOR REPLICATION,
	USER_ID				UDT_ID		NOT NULL,

--<			
	SBER_USER			UDT_USER	NOT NULL,
	SBER_PTS			UDT_PTS		NOT NULL,
	SBER_#PTS			UDT_#PTS	NULL,	
	SBER_ID_INT			UDT_ID_0	NOT NULL,
	SBER_UQID			UDT_UQID	NOT NULL ROWGUIDCOL,
	SBER_KZ_FREIGABE	UDT_BOOLEAN	NOT NULL,
	SBER_KZ_REPLIKATION	UDT_BOOLEAN	NOT NULL,
	SBER_KZ_GELOESCHT	UDT_BOOLEAN	NOT NULL,

	CONSTRAINT PK_SBER PRIMARY KEY CLUSTERED( SBER_ID )
);

CREATE UNIQUE INDEX SBER_IX_01_U ON notifadm.IO_SUBSCRIBER( SBER_UQID );
CREATE INDEX		SBER_IX_02	 ON notifadm.IO_SUBSCRIBER( SBER_KZ_GELOESCHT );

createView:

if not exists ( select * from sysobjects where id = object_id('notifadm.T_SUBSCRIBER') and OBJECTPROPERTY(id, 'IsView') = 1)
begin
	exec( N'create view notifadm.T_SUBSCRIBER as select * from INFORMATION_SCHEMA.TABLES;' );
end
GO

alter view notifadm.T_SUBSCRIBER(
		SBER_ID,

		USER_ID,
		SBER_USER,
		SBER_PTS,
		SBER_#PTS

) as
select	SBER_ID,

		USER_ID,
		SBER_USER,
		SBER_PTS,
		SBER_#PTS

from	notifadm.IO_SUBSCRIBER
where	SBER_KZ_GELOESCHT = 0;

GO
