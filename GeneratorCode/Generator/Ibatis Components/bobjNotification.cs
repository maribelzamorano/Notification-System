using System;

namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjNotification : BobjStandard
    {


        private string notificationIdField;
        private string subscriptionIdField;
        private string notificationInformationField;
        private string notificationIsSentField;
        private string kzUseTransactionField;
        private string debugField;


        public string notificationId
        {
            set { notificationIdField = value; }
            get { return notificationIdField; }
        }

        public string subscriptionId
        {
            set { subscriptionIdField = value; }
            get { return subscriptionIdField; }
        }

        public string notificationInformation
        {
            set { notificationInformationField = value; }
            get { return notificationInformationField; }
        }

        public string notificationIsSent
        {
            set { notificationIsSentField = value; }
            get { return notificationIsSentField; }
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