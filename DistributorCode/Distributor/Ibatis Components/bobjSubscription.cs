using System;

namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjSubscription : BobjStandard
    {

        private string subscriptionIdField;
        private string subscriberIdField;
        private string deviceIdField;
        private string subscriptionTypeCodeField;
        private string subscriptionParametersField;
        private string kzUseTransactionField;
        private string debugField;

        public string subscriptionId
        {
            set { subscriptionIdField = value; }
            get { return subscriptionIdField; }
        }

        public string subscriberId
        {
            set { subscriberIdField = value; }
            get { return subscriberIdField; }
        }

        public string deviceId
        {
            set { deviceIdField = value; }
            get { return deviceIdField; }
        }

        public string subscriptionTypeCode
        {
            set { subscriptionTypeCodeField = value; }
            get { return subscriptionTypeCodeField; }
        }

        public string subscriptionParameters
        {
            set { subscriptionParametersField = value; }
            get { return subscriptionParametersField; }
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