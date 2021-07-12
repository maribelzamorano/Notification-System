/*	
 * topdev GmbH, erstellt am 20.01.2010 10:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: 2010-01-20 10:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (06) notifadm.fk_DEVC.sql $
 *
 */

if exists(	select	1
		from	sysobjects
		where	name = 'FK_DEVC_SBER'
		and	xtype = 'F'
		and	parent_obj = object_id('notifadm.IO_DEVICE')
		)

	alter table notifadm.IO_DEVICE drop constraint FK_DEVC_SBER;
GO

if exists(	select	1
		from	sysobjects
		where	name = 'FK_DEVC_CMMD'
		and	xtype = 'F'
		and	parent_obj = object_id('notifadm.IO_DEVICE')
		)

	alter table notifadm.IO_DEVICE drop constraint FK_DEVC_CMMD;
GO

ALTER TABLE notifadm.IO_DEVICE ADD 

CONSTRAINT FK_DEVC_SBER FOREIGN KEY (SBER_ID) REFERENCES notifadm.IO_SUBSCRIBER(SBER_ID),
CONSTRAINT FK_DEVC_CMMD FOREIGN KEY (CMMD_CODE) REFERENCES notifadm.IO_COMMUNICATION_METHOD(CMMD_CODE);


if exists(	select	1
		from	sysindexes
		where	name = 'DEVC_FK_SBER' 
		and	id = object_id('notifadm.IO_DEVICE')
		)

	drop index notifadm.IO_DEVICE.DEVC_FK_SBER;
GO

if exists(	select	1
		from	sysindexes
		where	name = 'DEVC_FK_CMMD' 
		and	id = object_id('notifadm.IO_DEVICE')
		)

	drop index notifadm.IO_DEVICE.DEVC_FK_CMMD;
GO

CREATE INDEX DEVC_FK_SBER ON notifadm.IO_DEVICE( SBER_ID );
CREATE INDEX DEVC_FK_CMMD ON notifadm.IO_DEVICE( CMMD_CODE );