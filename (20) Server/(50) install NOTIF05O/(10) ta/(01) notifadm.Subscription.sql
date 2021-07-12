/*	
 * topdev GmbH, erstellt am 15.01.2010 11:00
 *
 * $Author: Renato Fontes $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (01) notifadm.IO_SUBSCRIPTION.sql $
 *
 */


if exists ( select * from sysobjects where id = object_id('notifadm.IO_SUBSCRIPTION') and OBJECTPROPERTY(id, 'IsTable') = 1)
begin
	GOTO createView;
--	drop table notifadm.IO_SUBSCRIPTION;
end;

create table notifadm.IO_SUBSCRIPTION(
	SBPN_ID				UDT_ID IDENTITY NOT FOR REPLICATION,

	SBER_ID				UDT_ID		NOT NULL,
	DEVC_ID				UDT_ID		NOT NULL,

	SBTP_CODE			UDT_CODE	NOT NULL,
	SBPN_PARAMETERS		xml			NOT NULL,

	SBPN_USER			UDT_USER	NOT NULL,
	SBPN_PTS			UDT_PTS		NOT NULL,
	SBPN_#PTS			UDT_#PTS	NULL,	
	SBPN_ID_INT			UDT_ID_0	NOT NULL,
	SBPN_UQID			UDT_UQID	NOT NULL ROWGUIDCOL,
	SBPN_KZ_FREIGABE	UDT_BOOLEAN	NOT NULL,
	SBPN_KZ_REPLIKATION	UDT_BOOLEAN	NOT NULL,
	SBPN_KZ_GELOESCHT	UDT_BOOLEAN	NOT NULL,

	CONSTRAINT PK_SBPN PRIMARY KEY CLUSTERED( SBPN_ID )
);

CREATE UNIQUE INDEX SBPN_IX_01_U ON notifadm.IO_SUBSCRIPTION( SBPN_UQID );
CREATE INDEX		SBPN_IX_02	 ON notifadm.IO_SUBSCRIPTION( SBPN_KZ_GELOESCHT );

createView:

if not exists ( select * from sysobjects where id = object_id('notifadm.T_SUBSCRIPTION') and OBJECTPROPERTY(id, 'IsView') = 1)
begin
	exec( N'create view notifadm.T_SUBSCRIPTION as select * from INFORMATION_SCHEMA.TABLES;' );
end
GO

alter view notifadm.T_SUBSCRIPTION(
		SBPN_ID,

		SBER_ID,
		DEVC_ID,

		SBTP_CODE,
		SBPN_PARAMETERS,

		SBPN_USER,
		SBPN_PTS,
		SBPN_#PTS

) as
select	SBPN_ID,

		SBER_ID,
		DEVC_ID,

		SBTP_CODE,
		SBPN_PARAMETERS,

		SBPN_USER,
		SBPN_PTS,
		SBPN_#PTS

from	notifadm.IO_SUBSCRIPTION
where	SBPN_KZ_GELOESCHT = 0;

GO
