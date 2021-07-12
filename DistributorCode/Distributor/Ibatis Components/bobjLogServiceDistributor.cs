using System;

namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjLogServiceDistributor : BobjStandard
    {

        private string logServiceDistributorIdField;
        private string logServiceDistributorstartTimeField;
        private string logServiceDistributorendTimeField;
        private string logServiceDistributorRcField;
        private string logServiceDistributorRcTextField;
        private string kzUseTransactionField;
        private string debugField;


        public string logServiceDistributorId
        {
            set { logServiceDistributorIdField = value; }
            get { return logServiceDistributorIdField; }
        }

        public string logServiceDistributorStartTime
        {
            set { logServiceDistributorstartTimeField = value; }
            get { return logServiceDistributorstartTimeField; }
        }

        public string logServiceDistributorEndTime
        {
            set { logServiceDistributorendTimeField = value; }
            get { return logServiceDistributorendTimeField; }
        }

        public string logServiceDistributorRc
        {
            set { logServiceDistributorRcField = value; }
            get { return logServiceDistributorRcField; }
        }

        public string logServiceDistributorRcText
        {
            set { logServiceDistributorRcTextField = value; }
            get { return logServiceDistributorRcTextField; }
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