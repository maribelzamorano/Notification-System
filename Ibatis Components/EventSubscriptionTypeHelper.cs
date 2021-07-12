using System.Collections;

namespace com.topdev.aa.data
{
    /// <summary>
    /// Helper class for SubscriptionType entities.
    /// </summary>
    public class EventSubscriptionTypeHelper : Helper
    {
        public bobjEventSubscriptionType Select(string id)
        {
            return (bobjEventSubscriptionType)Mapper().QueryForObject("EventSubscriptionType.Select", id);
        }

        public IList SelectAll()
        {
            return Mapper().QueryForList("EventSubscriptionType.Select", null);
        }

        public void Insert(bobjEventSubscriptionType EventSubscriptionType)
        {
            EventSubscriptionType.actionCode = "10";
            Mapper().Insert("EventSubscriptionType.IUDProcedure", EventSubscriptionType);
        }

        public int Update(bobjEventSubscriptionType EventSubscriptionType)
        {
            EventSubscriptionType.actionCode = "20";
            return Mapper().Update("EventSubscriptionType.IUDProcedure", EventSubscriptionType);
        }

        public int Delete(bobjEventSubscriptionType EventSubscriptionType)
        {
            EventSubscriptionType.actionCode = "90";
            return Mapper().Delete("EventSubscriptionType.IUDProcedure", EventSubscriptionType);
        }
    }
}