/*	
 * topdev GmbH, erstellt am 20.01.2010 10:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: 2010-01-20 10:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (06) notifadm.fk_SBPN.sql $
 *
 */

if exists(	select	1
		from	sysobjects
		where	name = 'FK_SBPN_SBER'
		and	xtype = 'F'
		and	parent_obj = object_id('notifadm.IO_SUBSCRIPTION')
		)

	alter table notifadm.IO_SUBSCRIPTION drop constraint FK_SBPN_SBER;
GO

if exists(	select	1
		from	sysobjects
		where	name = 'FK_SBPN_DEVC'
		and	xtype = 'F'
		and	parent_obj = object_id('notifadm.IO_SUBSCRIPTION')
		)

	alter table notifadm.IO_SUBSCRIPTION drop constraint FK_SBPN_DEVC;
GO

if exists(	select	1
		from	sysobjects
		where	name = 'FK_SBPN_SBTP'
		and	xtype = 'F'
		and	parent_obj = object_id('notifadm.IO_SUBSCRIPTION')
		)

	alter table notifadm.IO_SUBSCRIPTION drop constraint FK_SBPN_SBTP;
GO

ALTER TABLE notifadm.IO_SUBSCRIPTION ADD 

CONSTRAINT FK_SBPN_SBER FOREIGN KEY (SBER_ID) REFERENCES notifadm.IO_SUBSCRIBER(SBER_ID),
CONSTRAINT FK_SBPN_DEVC FOREIGN KEY (DEVC_ID) REFERENCES notifadm.IO_DEVICE(DEVC_ID),
CONSTRAINT FK_SBPN_SBTP FOREIGN KEY (SBTP_CODE) REFERENCES notifadm.IO_SUBSCRIPTION_TYPE(SBTP_CODE);


if exists(	select	1
		from	sysindexes
		where	name = 'SBPN_FK_SBER' 
		and	id = object_id('notifadm.IO_SUBSCRIPTION')
		)

	drop index notifadm.IO_SUBSCRIPTION.SBPN_FK_SBER;
GO

if exists(	select	1
		from	sysindexes
		where	name = 'SBPN_FK_DEVC' 
		and	id = object_id('notifadm.IO_SUBSCRIPTION')
		)

	drop index notifadm.IO_SUBSCRIPTION.SBPN_FK_DEVC;
GO

if exists(	select	1
		from	sysindexes
		where	name = 'SBPN_FK_SBTP' 
		and	id = object_id('notifadm.IO_SUBSCRIPTION')
		)

	drop index notifadm.IO_SUBSCRIPTION.SBPN_FK_SBTP;
GO

CREATE INDEX SBPN_FK_SBER ON notifadm.IO_SUBSCRIPTION( SBER_ID );
CREATE INDEX SBPN_FK_DEVC ON notifadm.IO_SUBSCRIPTION( DEVC_ID );
CREATE INDEX SBPN_FK_SBTP ON notifadm.IO_SUBSCRIPTION( SBTP_CODE );