
using System.Collections;

namespace com.topdev.aa.data
{
    /// <summary>
    /// Helper class for NotificationEvent entities.
    /// </summary>
    public class EventTypeHelper: Helper
    {
        public bobjEventType Select(string id)
        {
            return (bobjEventType)Mapper().QueryForObject("EventType.Select", int.Parse(id));
        }

        public IList SelectAll()
        {
            return Mapper().QueryForList("EventType.Select", null);
        }


        public bobjEventType MarkAsRead(string id)
        {
            return (bobjEventType)Mapper().QueryForObject("EventType.MarkAsRead", int.Parse(id));
        }

        public void Insert(bobjEventType bobjEventType)
        {
            bobjEventType.actionCode = "10";
            Mapper().Insert("EventType.IUDProcedure", bobjEventType);
        }

        public int Update(bobjEventType bobjEventType)
        {
            bobjEventType.actionCode = "20";
            return Mapper().Update("EventType.IUDProcedure", bobjEventType);
        }

        public int Delete(bobjEventType bobjEventType)
        {
            bobjEventType.actionCode = "90";
            return Mapper().Delete("EventType.IUDProcedure", bobjEventType);
        }

     

    }
}