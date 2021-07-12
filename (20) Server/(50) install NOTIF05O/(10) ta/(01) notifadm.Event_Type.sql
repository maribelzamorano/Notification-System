/*	
 * topdev GmbH, erstellt am 15.01.2010 10:00
 *
 * $Author: Maribel Zamorano $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (01) notifadm.Event_Type.sql $
 *
 */

if exists ( select * from sysobjects where id = object_id('notifadm.IO_EVENT_TYPE') and OBJECTPROPERTY(id, 'IsTable') = 1)
begin
	GOTO createView;
--	drop table notifadm.IO_EVENT_TYPE;
end;

create table notifadm.IO_EVENT_TYPE(
	EVTP_ID				UDT_ID IDENTITY NOT FOR REPLICATION,


-->	
	EVTP_CODE			UDT_CODE		NOT NULL,
	EVTP_DECODE 		UDT_DECODE		NOT NULL,
	EVTP_BTABLE			nvarchar(MAX)	NOT NULL,
	EVTP_IDBTABLE		nvarchar(255)	NOT NULL,

--<			

	EVTP_USER			UDT_USER	NOT NULL,
	EVTP_PTS			UDT_PTS		NOT NULL,
	EVTP_#PTS			UDT_#PTS	NULL,	
	EVTP_CODE_INT		UDT_ID_0	NOT NULL,
	EVTP_UQID			UDT_UQID	NOT NULL ROWGUIDCOL,
	EVTP_KZ_FREIGABE	UDT_BOOLEAN	NOT NULL,
	EVTP_KZ_REPLIKATION	UDT_BOOLEAN	NOT NULL,
	EVTP_KZ_GELOESCHT	UDT_BOOLEAN	NOT NULL,

	CONSTRAINT PK_EVTP PRIMARY KEY CLUSTERED( EVTP_ID )
);

CREATE UNIQUE INDEX EVTP_IX_01_U ON notifadm.IO_EVENT_TYPE( EVTP_UQID );
CREATE UNIQUE INDEX EVTP_IX_O2_U ON notifadm.IO_EVENT_TYPE( EVTP_CODE );
CREATE INDEX		EVTP_IX_02	 ON notifadm.IO_EVENT_TYPE( EVTP_KZ_GELOESCHT );

createView:

if not exists ( select * from sysobjects where id = object_id('notifadm.T_EVENT_TYPE') and OBJECTPROPERTY(id, 'IsView') = 1)
begin
	exec( N'create view notifadm.T_EVENT_TYPE as select * from INFORMATION_SCHEMA.TABLES;' );
end
GO

alter view notifadm.T_EVENT_TYPE(
		EVTP_ID,
		
		EVTP_CODE,
		EVTP_DECODE,
		EVTP_BTABLE,
		EVTP_IDBTABLE,

		EVTP_USER,
		EVTP_PTS,
		EVTP_#PTS

) as
select	EVTP_ID,
		
		EVTP_CODE,
		EVTP_DECODE,
		EVTP_BTABLE,
		EVTP_IDBTABLE,

		EVTP_USER,
		EVTP_PTS,
		EVTP_#PTS

from	notifadm.IO_EVENT_TYPE
where	EVTP_KZ_GELOESCHT = 0;

GO
