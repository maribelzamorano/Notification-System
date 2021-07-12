using System.Collections;

namespace com.topdev.aa.data
{
    /// <summary>
    /// Helper class for Subscription entities.
    /// </summary>
    public class SubscriptionHelper : Helper
    {
        public IList SelectBySubscriberId(string id)
        {
            return Mapper().QueryForList("SelectBySubscriberId", id);
        }

        public bobjSubscription SelectBySubscriptionId(string id)
        {
            return (bobjSubscription)Mapper().QueryForObject("SelectBySubscriptionId", id);
        }

        public bobjSubscription SubscriptionExists(bobjSubscription bobjSubscription)
        {
            return (bobjSubscription)Mapper().QueryForObject("Subscription.Exists", bobjSubscription);
        }

        public IList SelectAll()
        {
            return Mapper().QueryForList("Subscription.Select", null);
        }

        public void Insert(bobjSubscription bobjSubscription)
        {
            bobjSubscription.actionCode = "10";
            Mapper().Insert("Subscription.IUDProcedure", bobjSubscription);
        }

        public int Update(bobjSubscription bobjSubscription)
        {
            bobjSubscription.actionCode = "20";
            return Mapper().Update("Subscription.IUDProcedure", bobjSubscription);
        }

        public int Delete(bobjSubscription bobjSubscription)
        {
            bobjSubscription.actionCode = "90";
            return Mapper().Delete("Subscription.IUDProcedure", bobjSubscription);
        }



    }
}