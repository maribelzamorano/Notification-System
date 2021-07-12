using System;

namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjSubscriptionType : BobjStandard
    {
        private string subscriptionTypeIdField;
        private string subscriptionTypeCodeField;
        private string subscriptionTypeDecodeField;
        private string subscriptionTypeConditionsField;
        private string subscriptionTypeFieldsField;
        private string subscriptionTypeEmailAddressField;
        private string subscriptionTypeEmailCcField;
        private string subscriptionTypeEmailBccField;
        private string subscriptionTypeReplyAddressField;
        private string subscriptionTypeEmailSubjectField;
        private string subscriptionTypeIsDynamicSubField;
        private string kzUseTransactionField;
        private string debugField;


        public string subscriptionTypeId
        {
            set { subscriptionTypeIdField = value; }
            get { return subscriptionTypeIdField; }
        }

        public string subscriptionTypeCode
        {
            set { subscriptionTypeCodeField = value; }
            get { return subscriptionTypeCodeField; }
        }

        public string subscriptionTypeDecode
        {
            set { subscriptionTypeDecodeField = value; }
            get { return subscriptionTypeDecodeField; }
        }

        public string subscriptionTypeConditions
        {
            set { subscriptionTypeConditionsField = value; }
            get { return subscriptionTypeConditionsField; }
        }

        public string subscriptionTypeFields
        {
            set { subscriptionTypeFieldsField = value; }
            get { return subscriptionTypeFieldsField; }
        }

        public string subscriptionTypeEmailAddress
        {
            set { subscriptionTypeEmailAddressField = value; }
            get { return subscriptionTypeEmailAddressField; }
        }

        public string subscriptionTypeEmailCc
        {
            set { subscriptionTypeEmailCcField = value; }
            get { return subscriptionTypeEmailCcField; }
        }

        public string subscriptionTypeEmailBcc
        {
            set { subscriptionTypeEmailBccField = value; }
            get { return subscriptionTypeEmailBccField; }
        }

        public string subscriptionTypeReplyAddress
        {
            set { subscriptionTypeReplyAddressField = value; }
            get { return subscriptionTypeReplyAddressField; }
        }

        public string subscriptionTypeEmailSubject
        {
            set { subscriptionTypeEmailSubjectField = value; }
            get { return subscriptionTypeEmailSubjectField; }
        }

        public string subscriptionTypeIsDynamicSub
        {
            set { subscriptionTypeIsDynamicSubField = value; }
            get { return subscriptionTypeIsDynamicSubField; }
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
            return subscriptionTypeCode.ToString();
        }
    }
}