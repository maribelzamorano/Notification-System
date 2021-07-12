using System;

namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjNotificationText: BobjStandard
    {
        private string notificationTextIdField;
        private string subscriptionTypeCodeField;
        private string communicationMethodCodeField;
        private string notificationTextTextField;
        private string kzUseTransactionField;
        private string debugField;


        public string notificationTextId
        {
            set { notificationTextIdField = value; }
            get { return notificationTextIdField; }
        }

        public string subscriptionTypeCode
        {
            set { subscriptionTypeCodeField = value; }
            get { return subscriptionTypeCodeField; }
        }

        public string communicationMethodCode
        {
            set { communicationMethodCodeField = value; }
            get { return communicationMethodCodeField; }
        }

        public string notificationTextText
        {
            set { notificationTextTextField = value; }
            get { return notificationTextTextField; }
        }

        public string kzUseTransaction
        {
            set { kzUseTransactionField = value; }
            get { return kzUseTransactionField; }
        }

        public string debug
        {
            set { debugField = value; }
            get { return debugField; }
        }
     

    }
}