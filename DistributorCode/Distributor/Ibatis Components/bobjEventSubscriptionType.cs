using System;
namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjEventSubscriptionType : BobjStandard
    {

        private string eventSubscriptionTypeIdField;
        private string subscriptionTypeCodeField;
        private string eventTypeCodeField;
        private string kzUseTransactionField;
        private string debugField;


        public string eventSubscriptionTypeId
        {
            get { return eventSubscriptionTypeIdField; }
            set { eventSubscriptionTypeIdField = value; }
        }

        public string subscriptionTypeCode
        {
            get { return subscriptionTypeCodeField; }
            set { subscriptionTypeCodeField = value; }
        }

        public string eventTypeCode
        {
            get { return eventTypeCodeField; }
            set { eventTypeCodeField = value; }
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
        public override string ToString()
        {
            return eventSubscriptionTypeId.ToString();
        }

    }
}

