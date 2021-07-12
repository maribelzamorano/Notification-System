using System;
namespace com.topdev.aa.data
{
    [Serializable]
    public class bobjNotificationGenerator : BobjStandard
    {
        private string subscriptionIdField;
        private string notificationEventIdField;
        private string queryField;

        public string subscriptionId
        {
            set { subscriptionIdField = value; }
            get { return subscriptionIdField; }
        }

        public string notificationEventId
        {
            set { notificationEventIdField = value; }
            get { return notificationEventIdField; }
        }

        public string query
        {
            set { queryField = value; }
            get { return queryField; }
        }

    }
}