using System;

namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjDevice : BobjStandard
    {

        private string deviceIdField;
        private string subscriberIdField;
        private string communicationMethodCodeField;
        private string deviceAddressField;
        private string kzUseTransactionField;
        private string debugField;


        public string deviceId
        {
            set { deviceIdField = value; }
            get { return deviceIdField; }
        }

        public string subscriberId
        {
            set { subscriberIdField = value; }
            get { return subscriberIdField; }
        }

        public string communicationMethodCode
        {
            set { communicationMethodCodeField = value; }
            get { return communicationMethodCodeField; }
        }

        public string deviceAddress
        {
            set { deviceAddressField = value; }
            get { return deviceAddressField; }
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
            return deviceId.ToString();
        }
    }
}