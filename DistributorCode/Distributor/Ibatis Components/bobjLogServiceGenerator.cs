using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjLogServiceGenerator : BobjStandard
    {
        private string logServiceGeneratorIdField;
        private string logServiceGeneratorStartTimeField;
        private string logServiceGeneratorEndTimeField;
        private string logServiceGeneratorRcField;
        private string logServiceGeneratorRcTextField;
        private string kzUseTransactionField;
        private string debugField;

        public string logServiceGeneratorId
        {
            get { return logServiceGeneratorIdField; }
            set { logServiceGeneratorIdField = value; }
        }

        public string logServiceGeneratorStartTime
        {
            get { return logServiceGeneratorStartTimeField; }
            set { logServiceGeneratorStartTimeField = value; }
        }

        public string logServiceGeneratorEndTime
        {
            get { return logServiceGeneratorEndTimeField; }
            set { logServiceGeneratorEndTimeField = value; }
        }


        public string logServiceGeneratorRc
        {
            get { return logServiceGeneratorRcField; }
            set { logServiceGeneratorRcField = value; }
        }

        public string logServiceGeneratorRcText
        {
            get { return logServiceGeneratorRcTextField; }
            set { logServiceGeneratorRcTextField = value; }
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
