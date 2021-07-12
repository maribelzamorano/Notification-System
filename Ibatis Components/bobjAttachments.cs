using System;

namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjAttachments : BobjStandard
    {

        private string anlaIdField;
        private string anlaNameField;
        private byte[] anlaDateiField;
        private string anlaPtsField;
        private string anlaKzGeprueftField;
        private string debugField;

        private string sessionIdField = "846cad1261864671a9441d2e022d94f0";
        private string userField = "services.notification";

        public string sessionId
        {
            get { return sessionIdField; }
            set { sessionIdField = value; }
        }

        public string user
        {
            get { return userField; }
            set { userField = value; }
        }

        public string anlaId
        {
            get { return anlaIdField; }
            set { anlaIdField = value; }
        }

        public string anlaName
        {
            get { return anlaNameField; }
            set { anlaNameField = value; }
        }

        public byte[] anlaDatei
        {
            get { return anlaDateiField; }
            set { anlaDateiField = value; }
        }

        public string anlaPts
        {
            get { return anlaPtsField; }
            set { anlaPtsField = value; }
        }

        public string anlaKzGeprueft
        {
            get { return anlaKzGeprueftField; }
            set { anlaKzGeprueftField = value; }
        }
       
        public string debug
        {
            get { return debugField; }
            set { debugField = value; }
        }
    }
}