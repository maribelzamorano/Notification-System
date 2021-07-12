/*	
 * topdev GmbH, erstellt am 20.01.2010 10:00
 *
 * $Author: Maribel Zamorano $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (06) notifadm.create.fk_NFEV.sql $
 *
 */

if exists(	select	1
		from	sysobjects
		where	name = 'FK_NFEV_EVTP'
		and	xtype = 'F'
		and	parent_obj = object_id('notifadm.IO_NOTIFICATION_EVENT')
		)

	alter table notifadm.IO_NOTIFICATION_EVENT drop constraint FK_NFEV_EVTP;
GO


ALTER TABLE notifadm.IO_NOTIFICATION_EVENT ADD
	CONSTRAINT FK_NFEV_EVTP FOREIGN KEY ( EVTP_CODE ) REFERENCES notifadm.IO_EVENT_TYPE( EVTP_CODE )
GO

if exists(	select	1
		from	sysindexes
		where	name = 'NFEV_FK_EVTP' 
		and	id = object_id('notifadm.IO_NOTIFICATION_EVENT')
		)

	drop index notifadm.IO_NOTIFICATION_EVENT.NFEV_FK_EVTP;
GO

CREATE INDEX NFEV_FK_EVTP ON notifadm.IO_NOTIFICATION_EVENT( EVTP_CODE );
GO

