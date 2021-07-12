/*	
 * topdev GmbH, erstellt am 20.01.2010 10:00
 *
 * $Author: Maribel Zamorano $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (06) notifadm.create.fk_EVST.sql $
 *
 */

if exists(	select	1
		from	sysobjects
		where	name = 'FK_EVST_SBTP'
		and	xtype = 'F'
		and	parent_obj = object_id('notifadm.IO_EVENT_SUBSCRIPTION_TYPE')
		)

	alter table notifadm.IO_EVENT_SUBSCRIPTION_TYPE drop constraint FK_EVST_SBTP;
GO

if exists(	select	1
		from	sysobjects
		where	name = 'FK_EVST_EVTP'
		and	xtype = 'F'
		and	parent_obj = object_id('notifadm.IO_EVENT_SUBSCRIPTION_TYPE')
		)

	alter table notifadm.IO_EVENT_SUBSCRIPTION_TYPE drop constraint FK_EVST_EVTP;
GO


ALTER TABLE notifadm.IO_EVENT_SUBSCRIPTION_TYPE ADD
	CONSTRAINT FK_EVST_SBTP FOREIGN KEY ( SBTP_CODE ) REFERENCES notifadm.IO_SUBSCRIPTION_TYPE ( SBTP_CODE ),
	CONSTRAINT FK_EVST_EVTP FOREIGN KEY ( EVTP_CODE ) REFERENCES notifadm.IO_EVENT_TYPE( EVTP_CODE )
GO

if exists(	select	1
		from	sysindexes
		where	name = 'EVST_FK_SBTP' 
		and	id = object_id('notifadm.IO_EVENT_SUBSCRIPTION_TYPE')
		)

	drop index notifadm.IO_EVENT_SUBSCRIPTION_TYPE.EVST_FK_SBTP;
GO

if exists(	select	1
		from	sysindexes
		where	name = 'EVST_FK_EVTP' 
		and	id = object_id('notifadm.IO_EVENT_SUBSCRIPTION_TYPE')
		)

	drop index notifadm.IO_EVENT_SUBSCRIPTION_TYPE.EVST_FK_EVTP;
GO

CREATE INDEX EVST_FK_SBTP ON notifadm.IO_EVENT_SUBSCRIPTION_TYPE( SBTP_CODE );
CREATE INDEX EVST_FK_EVTP ON notifadm.IO_EVENT_SUBSCRIPTION_TYPE( EVTP_CODE );
GO

