/*	
 * topdev GmbH, erstellt am 20.01.2010 10:00
 *
 * $Author: Maribel Zamorano $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (06) notifadm.create.fk_NOTF.sql $
 *
 */

if exists(	select	1
		from	sysobjects
		where	name = 'FK_NOTF_SBPN'
		and	xtype = 'F'
		and	parent_obj = object_id('notifadm.IO_NOTIFICATION')
		)

	alter table notifadm.IO_NOTIFICATION drop constraint FK_NOTF_SBPN;
GO

if exists(	select	1
		from	sysobjects
		where	name = 'FK_NOTF_NFEV'
		and	xtype = 'F'
		and	parent_obj = object_id('notifadm.IO_NOTIFICATION')
		)

	alter table notifadm.IO_NOTIFICATION drop constraint FK_NOTF_NFEV;
GO


ALTER TABLE notifadm.IO_NOTIFICATION ADD
	CONSTRAINT FK_NOTF_SBPN FOREIGN KEY ( SBPN_ID ) REFERENCES notifadm.IO_SUBSCRIPTION ( SBPN_ID ),
	CONSTRAINT FK_NOTF_NFEV FOREIGN KEY ( NFEV_ID ) REFERENCES notifadm.IO_NOTIFICATION_EVENT ( NFEV_ID );

GO

if exists(	select	1
		from	sysindexes
		where	name = 'NOTF_FK_SBPN' 
		and	id = object_id('notifadm.IO_NOTIFICATION')
		)

	drop index notifadm.IO_NOTIFICATION.NOTF_FK_SBPN;
GO



CREATE INDEX NOTF_FK_SBPN ON notifadm.IO_NOTIFICATION( SBPN_ID );
GO

