using System;
namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjNotificationEvent : BobjStandard
    {
        private string notificationEventIdField;
        private string eventTypeCodeField;
        private string eventIdField;
        private string userIdField;
        private string notificationEventEmailCcField;
        private string notificationEventEmailBccField;
        private string notificationEventAttachmentField;
        private string notificationEventInformationField;
        private string notificationEventDirectInformationField;
        private string isReadField;
        private string kzUseTransactionField;
        private string debugField;


        public string notificationEventId
        {
            get { return notificationEventIdField; }
            set { notificationEventIdField = value; }
        }

        public string eventTypeCode
        {
            get { return eventTypeCodeField; }
            set { eventTypeCodeField = value; }
        }

        public string eventId
        {
            get { return eventIdField; }
            set { eventIdField = value; }
        }

        public string userId
        {
            get { return userIdField; }
            set { userIdField = value; }
        }

        public string notificationEventEmailCc
        {
            get { return notificationEventEmailCcField; }
            set { notificationEventEmailCcField = value; }
        }

        public string notificationEventEmailBcc
        {
            get { return notificationEventEmailBccField; }
            set { notificationEventEmailBccField = value; }
        }

        public string notificationEventAttachment
        {
            set { notificationEventAttachmentField = value; }
            get { return notificationEventAttachmentField; }
        }

        public string notificationEventInformation
        {
            get { return notificationEventInformationField; }
            set { notificationEventInformationField = value; }
        }

        public string notificationEventDirectInformation
        {
            get { return notificationEventDirectInformationField; }
            set { notificationEventDirectInformationField = value; }
        }

        public string notificationEventIsRead
        {
            get { return isReadField; }
            set { isReadField = value; }
        }

        public string kzUseTransaction
        {
            get { return kzUseTransactionField; }
            set { kzUseTransactionField = value; }
        }

        public string debug
        {
            get { return debugField; }
            set { debugField = value; }
        }

    }
}

