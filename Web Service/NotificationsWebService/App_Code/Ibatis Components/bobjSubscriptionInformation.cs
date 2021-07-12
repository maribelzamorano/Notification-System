using System;
namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjSubscriptionInformation : BobjStandard
    {
        private string subscriptionIdField;

        private string subscriptionParametersField;

        private string subscriberIdField;

        private string userIdField;

        private string deviceIdField;

        private string deviceAddressField;

        private string communicationMethodCodeField;

        private string subscriptionTypeCodeField;

        private string subscriptionTypeFieldsField;

        private string subscriptionTypeEmailAddressField;

        private string subscriptionTypeReplyAddressField;

        private string subscriptionTypeEmailCcField;

        private string subscriptionTypeEmailBccField;

        private string subscriptionTypeEmailSubjectField;

        private string eventTypeCodeField;

        private string businessTableNameField;

        private string bussinesTableIdField;

        private string subscriptionTypeConditionsField;



        public string subscriptionId
        {
            get { return subscriptionIdField; }
            set { subscriptionIdField = value; }
        }

        public string subscriptionParameters
        {
            get { return subscriptionParametersField; }
            set { subscriptionParametersField = value; }
        }

        public string subscriberId
        {
            get { return subscriberIdField; }
            set { subscriberIdField = value; }
        }

        public string userId
        {
            get { return userIdField; }
            set { userIdField = value; }
        }

        public string deviceId
        {
            get { return deviceIdField; }
            set { deviceIdField = value; }
        }

        public string deviceAddress
        {
            get { return deviceAddressField; }
            set { deviceAddressField = value; }
        }

        public string communicationMethodCode
        {
            get { return communicationMethodCodeField; }
            set { communicationMethodCodeField = value; }
        }

        public string subscriptionTypeCode
        {
            get { return subscriptionTypeCodeField; }
            set { subscriptionTypeCodeField = value; }
        }

        public string subscriptionTypeFields
        {
            get { return subscriptionTypeFieldsField; }
            set { subscriptionTypeFieldsField = value; }
        }

        public string subscriptionTypeEmailAddress
        {
            get { return subscriptionTypeEmailAddressField; }
            set { subscriptionTypeEmailAddressField = value; }
        }

        public string subscriptionTypeReplyAddress
        {
            get { return subscriptionTypeEmailAddressField; }
            set { subscriptionTypeEmailAddressField = value; }
        }

        public string subscriptionTypeEmailCc
        {
            get { return subscriptionTypeEmailCcField; }
            set { subscriptionTypeEmailCcField = value; }
        }

        public string subscriptionTypeEmailBcc
        {
            get { return subscriptionTypeEmailBccField; }
            set { subscriptionTypeEmailBccField = value; }
        }

        public string subscriptionTypeEmailSubject
        {
            get { return subscriptionTypeEmailSubjectField; }
            set { subscriptionTypeEmailSubjectField = value; }
        }

        public string eventTypeCode
        {
            get { return eventTypeCodeField; }
            set { eventTypeCodeField = value; }
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

        public string subscriptionTypeConditions
        {
            get { return subscriptionTypeConditionsField; }
            set { subscriptionTypeConditionsField = value; }
        }
    }
}

