/*	
 * topdev GmbH, erstellt am 20.01.2010 09:00
 *
 * $Author: Maribel Zamorano $
 * $Date: 2010-01-20 09:00:23 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (01) notifadm.V_NOTIFICATION_INFORMATION.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('notifadm.V_NOTIFICATION_INFORMATION') and OBJECTPROPERTY(id, 'IsView') = 1)
begin
	exec( N'create view notifadm.V_NOTIFICATION_INFORMATION as select * from INFORMATION_SCHEMA.TABLES;' );
end
GO

alter view notifadm.V_NOTIFICATION_INFORMATION(
		NOTF_ID,
		NOTF_INFORMATION,
		SBPN_ID,
		SBER_ID,
		NFEV_ID,
		NFEV_DIRECTINFORMATION,
		NFEV_EMAILCC,
		NFEV_EMAILBCC,
		NFEV_ATTACHMENT,
		DEVC_ID,
		DEVC_ADDRESS,
		SBTP_CODE,
		SBTP_DECODE,
		SBTP_EMAILADR,
		SBTP_EMAILREPLYADR,
		SBTP_EMAILCC,
		SBTP_EMAILBCC,
		SBTP_EMAILSUB,
		SBTP_ISDYNAMICSUB,
		NOTX_TEXT,
		CMMD_CODE,
		CMMD_DECODE



) as
select	NOTF_ID,
		NOTF_INFORMATION,
		T_SUBSCRIPTION.SBPN_ID,
		T_SUBSCRIPTION.SBER_ID,
		T_NOTIFICATION_EVENT.NFEV_ID,
		NFEV_DIRECTINFORMATION,
		NFEV_EMAILCC,
		NFEV_EMAILBCC,
		NFEV_ATTACHMENT,
		T_SUBSCRIPTION.DEVC_ID,
		DEVC_ADDRESS,
		T_SUBSCRIPTION_TYPE.SBTP_CODE,
		SBTP_DECODE,
		SBTP_EMAILADR,
		SBTP_EMAILREPLYADR,
		SBTP_EMAILCC,
		SBTP_EMAILBCC,
		SBTP_EMAILSUB,
		SBTP_ISDYNAMICSUB,
		NOTX_TEXT,
		T_COMMUNICATION_METHOD.CMMD_CODE,
		CMMD_DECODE

from	notifadm.T_NOTIFICATION 
		left join notifadm.T_SUBSCRIPTION on T_SUBSCRIPTION.SBPN_ID=T_NOTIFICATION.SBPN_ID
		left join notifadm.T_DEVICE on T_SUBSCRIPTION.DEVC_ID=T_DEVICE.DEVC_ID
		left join notifadm.T_SUBSCRIPTION_TYPE on T_SUBSCRIPTION.SBTP_CODE=T_SUBSCRIPTION_TYPE.SBTP_CODE
		left join notifadm.T_COMMUNICATION_METHOD on T_DEVICE.CMMD_CODE=T_COMMUNICATION_METHOD.CMMD_CODE
		left join notifadm.T_NOTIFICATION_EVENT on T_NOTIFICATION.NFEV_ID = T_NOTIFICATION_EVENT.NFEV_ID
		left join notifadm.T_NOTIFICATION_TEXT on (T_SUBSCRIPTION_TYPE.SBTP_CODE = T_NOTIFICATION_TEXT.SBTP_CODE
													AND T_COMMUNICATION_METHOD.CMMD_CODE = T_NOTIFICATION_TEXT.CMMD_CODE)

where NOTF_ISSENT=0
GO

