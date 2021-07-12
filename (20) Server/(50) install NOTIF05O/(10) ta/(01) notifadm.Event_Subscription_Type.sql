/*	
 * topdev GmbH, erstellt am 15.01.2010 10:00
 *
 * $Author: Maribel Zamorano $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (01) notifadm.Event_Subscription_Type.sql $
 *
 */

if exists ( select * from sysobjects where id = object_id('notifadm.IO_EVENT_SUBSCRIPTION_TYPE') and OBJECTPROPERTY(id, 'IsTable') = 1)
begin
	GOTO createView;
--	drop table notifadm.IO_EVENT_SUBSCRIPTION_TYPE;
end;

create table notifadm.IO_EVENT_SUBSCRIPTION_TYPE(
	EVST_ID				UDT_ID IDENTITY NOT FOR REPLICATION,

--> 
	SBTP_CODE			UDT_CODE	NOT NULL,
	EVTP_CODE			UDT_CODE	NOT NULL,

--<			

	EVST_USER			UDT_USER	NOT NULL,
	EVST_PTS			UDT_PTS		NOT NULL,
	EVST_#PTS			UDT_#PTS	NULL,	
	EVST_CODE_INT		UDT_ID_0	NOT NULL,
	EVST_UQID			UDT_UQID	NOT NULL ROWGUIDCOL,
	EVST_KZ_FREIGABE	UDT_BOOLEAN	NOT NULL,
	EVST_KZ_REPLIKATION	UDT_BOOLEAN	NOT NULL,
	EVST_KZ_GELOESCHT	UDT_BOOLEAN	NOT NULL,

	CONSTRAINT PK_EVST PRIMARY KEY CLUSTERED( EVST_ID )
);

CREATE UNIQUE INDEX EVST_IX_01_U ON notifadm.IO_EVENT_SUBSCRIPTION_TYPE( EVST_UQID );
CREATE UNIQUE INDEX EVST_IX_O2_U ON notifadm.IO_EVENT_SUBSCRIPTION_TYPE( SBTP_CODE, EVTP_CODE );
CREATE INDEX		EVST_IX_02	 ON notifadm.IO_EVENT_SUBSCRIPTION_TYPE( EVST_KZ_GELOESCHT );

createView:

if not exists ( select * from sysobjects where id = object_id('notifadm.T_EVENT_SUBSCRIPTION_TYPE') and OBJECTPROPERTY(id, 'IsView') = 1)
begin
	exec( N'create view notifadm.T_EVENT_SUBSCRIPTION_TYPE as select * from INFORMATION_SCHEMA.TABLES;' );
end
GO

alter view notifadm.T_EVENT_SUBSCRIPTION_TYPE(
		EVST_ID,

		SBTP_CODE,
		EVTP_CODE,

		EVST_USER,
		EVST_PTS,
		EVST_#PTS

) as
select	EVST_ID,

		SBTP_CODE,
		EVTP_CODE,

		EVST_USER,
		EVST_PTS,
		EVST_#PTS

from	notifadm.IO_EVENT_SUBSCRIPTION_TYPE
where	EVST_KZ_GELOESCHT = 0;

GO
