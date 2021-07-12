using System;

namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjCommunicationMethod : BobjStandard
    {
        private string communicationMethodIdField;
        private string communicationMethodCodeField;
        private string communicationMethodDecodeField;
        private string kzUseTransactionField;
        private string debugField;




        public string communicationMethodId
        {
            set { communicationMethodIdField = value; }
            get { return communicationMethodIdField; }
        }
         public string communicationMethodCode
        {
            set { communicationMethodCodeField = value; }
            get { return communicationMethodCodeField; }
        }
        public string communicationMethodDecode
        {
            set { communicationMethodDecodeField = value; }
            get { return communicationMethodDecodeField; }
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
        public override string ToString()
        {
            return communicationMethodCode.ToString();
        }

    }
}