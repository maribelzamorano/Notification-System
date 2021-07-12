using System;
namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjEventType : BobjStandard
    {
        private string eventTypeIdField;
        private string eventTypeCodeField;
        private string eventTypeDecodeField;
        private string businessTableNameField;
        private string bussinesTableIdField;
        private string kzUseTransactionField;
        private string debugField;


        public string eventTypeId
        {
            get { return eventTypeIdField; }
            set { eventTypeIdField = value; }
        }

        public string eventTypeCode
        {
            get { return eventTypeCodeField; }
            set { eventTypeCodeField = value; }
        }


        public string eventTypeDecode
        {
            get { return eventTypeDecodeField; }
            set { eventTypeDecodeField = value; }
        }

        public string businessTableName
        {
            get { return businessTableNameField; }
            set { businessTableNameField = value; }
        }

        public string bussinesTableId
        {
            get { return bussinesTableIdField; }
            set { bussinesTableIdField = value; }
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
            return eventTypeCode.ToString();
        }

    }
}

