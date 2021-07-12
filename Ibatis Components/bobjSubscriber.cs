using System;
namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjSubscriber : BobjStandard
    {


        private string subscriberIdField;
        private string userIdField;
        private string kzUseTransactionField;
        private string debugField;



        public string subscriberId 
        {
            set { subscriberIdField = value; }
            get { return subscriberIdField; }
        }
        
        public string userId 
        {
            set { userIdField = value; }
            get { return userIdField; }
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
            return  subscriberId.ToString();
        }
    }
}