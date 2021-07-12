using System;
namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjNotificationInformation : BobjStandard
    {
        private string notificationIdField;

        private string notificationInformationField;

        private string subscriptionIdField;

        private string subscriberIdField;

        private string notificationEventIdField;
       
        private string notificationEventDirectInformationField;

        private string deviceIdField;

        private string deviceAddressField;

        private string subscriptionTypeCodeField;

        private string subscriptionTypeDecodeField;

        private string subscriptionTypeEmailAddressField;

        private string subscriptionTypeEmailCcField;

        private string subscriptionTypeEmailBccField;

        private string subscriptionTypeReplyAddressField;

        private string subscriptionTypeEmailSubjectField;

        private string subscriptionTypeIsDynamicSubField;

        private string notificationEventEmailCcField;

        private string notificationEventEmailBccField;

        private string notificationEventAttachmentField;

        private string communicationMethodCodeField;

        private string communicationMethodDecodeField;

        private string notificationTextTextField;

        private string notificationIsSentField;



        public string notificationId
        {
            get { return notificationIdField; }
            set { notificationIdField = value; }
        }

        public string notificationInformation
        {
            get { return notificationInformationField; }
            set { notificationInformationField = value; }
        }

        public string subscriptionId
        {
            get { return subscriptionIdField; }
            set { subscriptionIdField = value; }
        }

        public string subscriberId
        {
            get { return subscriberIdField; }
            set { subscriberIdField = value; }
        }

        public string notificationEventId
        {
            get { return notificationEventIdField; }
            set { notificationEventIdField = value; }
        }
       
        public string notificationEventDirectInformation
        {
            get { return notificationEventDirectInformationField; }
            set { notificationEventDirectInformationField = value; }
        }

        public string deviceId
        {
            get { return deviceIdField; }
            set { deviceIdField = value; }
        }

        public string deviceAddress
        {
            get { return deviceAddressField; }
            set { deviceAddressField = value; }
        }

        public string subscriptionTypeCode
        {
            get { return subscriptionTypeCodeField; }
            set { subscriptionTypeCodeField = value; }
        }

        public string subscriptionTypeDecode
        {
            get { return subscriptionTypeDecodeField; }
            set { subscriptionTypeDecodeField = value; }
        }
        public string subscriptionTypeEmailAddress
        {
            set { subscriptionTypeEmailAddressField = value; }
            get { return subscriptionTypeEmailAddressField; }
        }

        public string subscriptionTypeEmailCc
        {
            set { subscriptionTypeEmailCcField = value; }
            get { return subscriptionTypeEmailCcField; }
        }

        public string subscriptionTypeEmailBcc
        {
            set { subscriptionTypeEmailBccField = value; }
            get { return subscriptionTypeEmailBccField; }
        }

        public string subscriptionTypeReplyAddress
        {
            set { subscriptionTypeReplyAddressField = value; }
            get { return subscriptionTypeReplyAddressField; }
        }

        public string subscriptionTypeEmailSubject
        {
            set { subscriptionTypeEmailSubjectField = value; }
            get { return subscriptionTypeEmailSubjectField; }
        }

        public string subscriptionTypeIsDynamicSub
        {
            set { subscriptionTypeIsDynamicSubField = value; }
            get { return subscriptionTypeIsDynamicSubField; }
        }

        public string notificationEventEmailCc
        {
            set { notificationEventEmailCcField = value; }
            get { return notificationEventEmailCcField; }
        }

        public string notificationEventEmailBcc
        {
            set { notificationEventEmailBccField = value; }
            get { return notificationEventEmailBccField; }
        }

        public string notificationEventAttachment
        {
            set { notificationEventAttachmentField = value; }
            get { return notificationEventAttachmentField; }
        }

        public string communicationMethodCode
        {
            get { return communicationMethodCodeField; }
            set { communicationMethodCodeField = value; }
        }

        public string communicationMethodDecode
        {
            get { return communicationMethodDecodeField; }
            set { communicationMethodDecodeField = value; }
        }

        public string notificationTextText
        {
            get { return notificationTextTextField; }
            set { notificationTextTextField = value; }
        }

        public string notificationIsSent
        {
            get { return notificationIsSentField; }
            set { notificationIsSentField = value; }
        }

       
    }
}

