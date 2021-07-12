using System.Collections;

namespace com.topdev.aa.data
{
    /// <summary>
    /// Helper class for SubscriptionType entities.
    /// </summary>
    public class SubscriptionTypeHelper: Helper
    {
        public bobjSubscriptionType Select(string id)
        {
            return (bobjSubscriptionType)Mapper().QueryForObject("SubscriptionType.Select", id);
        }
        public bobjSubscriptionType SelectSubsType(string id)
        {
            return (bobjSubscriptionType)Mapper().QueryForObject("SubscriptionType.SelectSubsType", id);
        }

        public IList SelectAll()
        {
            return Mapper().QueryForList("SubscriptionType.Select", null);
        }

        public void Insert(bobjSubscriptionType SubscriptionType)
        {
            SubscriptionType.actionCode = "10";
            Mapper().Insert("SubscriptionType.IUDProcedure", SubscriptionType);
        }

        public int Update(bobjSubscriptionType SubscriptionType)
        {
            SubscriptionType.actionCode = "20";
            return Mapper().Update("SubscriptionType.IUDProcedure", SubscriptionType);
        }

        public int Delete(bobjSubscriptionType SubscriptionType)
        {
            SubscriptionType.actionCode = "90";
            return Mapper().Delete("SubscriptionType.IUDProcedure", SubscriptionType);
        }
    }
}