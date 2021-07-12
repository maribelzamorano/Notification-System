
using System.Collections;

namespace com.topdev.aa.data
{
    /// <summary>
    /// Helper class for SubscriptionInformation entities.
    /// </summary>
    public class SubscriptionInformationHelper: Helper
    {
        public IList Select(string id)
        {
            return Mapper().QueryForList("SubscriptionInformation.Select", int.Parse(id));
        }
        public IList SelectUser(bobjNotificationEvent bobjNotificationEvent)
        {
            return Mapper().QueryForList("SubscriptionInformation.SelectUser", bobjNotificationEvent);
        }

        public IList SelectAll()
        {
            return Mapper().QueryForList("SubscriptionInformation.Select", null);
        }
        


    }
}