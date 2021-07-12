/*	
 * topdev GmbH, erstellt am 15.01.2010 10:00
 *
 * $Author: Maribel Zamorano $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (01) notifadm.Communication_Method.sql $
 *
 */

if exists ( select * from sysobjects where id = object_id('notifadm.IO_COMMUNICATION_METHOD') and OBJECTPROPERTY(id, 'IsTable') = 1)
begin
	GOTO createView;
----	drop table notifadm.IO_COMMUNICATION_METHOD;
end;

create table notifadm.IO_COMMUNICATION_METHOD(
	CMMD_ID				UDT_ID IDENTITY NOT FOR REPLICATION,

-->	
	CMMD_CODE			UDT_CODE NOT NULL,
	CMMD_DECODE			UDT_DECODE	NOT NULL,

--<			

	CMMD_USER			UDT_USER	NOT NULL,
	CMMD_PTS			UDT_PTS		NOT NULL,
	CMMD_#PTS			UDT_#PTS	NULL,	--as convert( nvarchar(23), CMMD_PTS, 121 ),
	CMMD_CODE_INT		UDT_ID_0	NOT NULL,
	CMMD_UQID			UDT_UQID	NOT NULL ROWGUIDCOL,
	CMMD_KZ_FREIGABE	UDT_BOOLEAN	NOT NULL,
	CMMD_KZ_REPLIKATION	UDT_BOOLEAN	NOT NULL,
	CMMD_KZ_GELOESCHT	UDT_BOOLEAN	NOT NULL,

	CONSTRAINT PK_CMMD PRIMARY KEY CLUSTERED( CMMD_ID )
);

CREATE UNIQUE INDEX CMMD_IX_01_U ON notifadm.IO_COMMUNICATION_METHOD( CMMD_UQID );
CREATE INDEX		CMMD_IX_02	 ON notifadm.IO_COMMUNICATION_METHOD( CMMD_KZ_GELOESCHT );

createView:

if not exists ( select * from sysobjects where id = object_id('notifadm.T_COMMUNICATION_METHOD') and OBJECTPROPERTY(id, 'IsView') = 1)
begin
	exec( N'create view notifadm.T_COMMUNICATION_METHOD as select * from INFORMATION_SCHEMA.TABLES;' );
end
GO

alter view notifadm.T_COMMUNICATION_METHOD(
		CMMD_ID,

		CMMD_CODE,
		CMMD_DECODE,

		CMMD_USER,
		CMMD_PTS,
		CMMD_#PTS

) as
select	CMMD_ID,

		CMMD_CODE,
		CMMD_DECODE,

		CMMD_USER,
		CMMD_PTS,
		CMMD_#PTS

from	notifadm.IO_COMMUNICATION_METHOD
where	CMMD_KZ_GELOESCHT = 0;

GO
