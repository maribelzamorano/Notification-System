/*	
 * topdev GmbH, erstellt am 20.01.2010 10:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: 2010-01-20 10:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (06) notifadm.fk_NOTX.sql $
 *
 */

if exists(	select	1
		from	sysobjects
		where	name = 'FK_NOTX_SBTP'
		and	xtype = 'F'
		and	parent_obj = object_id('notifadm.IO_NOTIFICATION_TEXT')
		)

	alter table notifadm.IO_NOTIFICATION_TEXT drop constraint FK_NOTX_SBTP;
GO

if exists(	select	1
		from	sysobjects
		where	name = 'FK_NOTX_CMMD'
		and	xtype = 'F'
		and	parent_obj = object_id('notifadm.IO_NOTIFICATION_TEXT')
		)

	alter table notifadm.IO_NOTIFICATION_TEXT drop constraint FK_NOTX_CMMD;
GO

ALTER TABLE notifadm.IO_NOTIFICATION_TEXT ADD 

CONSTRAINT FK_NOTX_SBTP FOREIGN KEY (SBTP_CODE) REFERENCES notifadm.IO_SUBSCRIPTION_TYPE(SBTP_CODE),
CONSTRAINT FK_NOTX_CMMD FOREIGN KEY (CMMD_CODE) REFERENCES notifadm.IO_COMMUNICATION_METHOD(CMMD_CODE);


if exists(	select	1
		from	sysindexes
		where	name = 'NOTX_FK_SBTP' 
		and	id = object_id('notifadm.IO_NOTIFICATION_TEXT')
		)

	drop index notifadm.IO_NOTIFICATION_TEXT.NOTX_FK_SBTP;
GO

if exists(	select	1
		from	sysindexes
		where	name = 'NOTX_FK_CMMD' 
		and	id = object_id('notifadm.IO_NOTIFICATION_TEXT')
		)

	drop index notifadm.IO_NOTIFICATION_TEXT.NOTX_FK_CMMD;
GO

CREATE INDEX NOTX_FK_DEVC ON notifadm.IO_NOTIFICATION_TEXT( SBTP_CODE );
CREATE INDEX NOTX_FK_SBTP ON notifadm.IO_NOTIFICATION_TEXT( CMMD_CODE );