
using System.Collections;

namespace com.topdev.aa.data
{
    /// <summary>
    /// Helper class for Subscriber entities.
    /// </summary>
    public class SubscriberHelper: Helper
    {
        public bobjSubscriber Select(string id)
        {
            return (bobjSubscriber)Mapper().QueryForObject("Subscriber.Select", int.Parse(id));
        }

        public bobjSubscriber UserExists(string id)
        {
            return (bobjSubscriber)Mapper().QueryForObject("Subscriber.Exists", int.Parse(id));
        }
        
        public IList SelectAll()
        {
            return Mapper().QueryForList("Subscriber.Select", null);
        }

        public void Insert(bobjSubscriber bobjSubscriber)
        {
            bobjSubscriber.actionCode = "10";
            Mapper().Insert("Subscriber.IUDProcedure", bobjSubscriber);
        }

        public int Update(bobjSubscriber bobjSubscriber)
        {
            bobjSubscriber.actionCode = "20";
            return Mapper().Update("Subscriber.IUDProcedure", bobjSubscriber);
        }

        public int Delete(bobjSubscriber bobjSubscriber)
        {
            bobjSubscriber.actionCode = "90";
            return Mapper().Delete("Subscriber.IUDProcedure", bobjSubscriber);
        }

   


    }
}