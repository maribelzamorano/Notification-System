
using System.Collections;

namespace com.topdev.aa.data
{
    /// <summary>
    /// Helper class for NotificationEvent entities.
    /// </summary>
    public class NotificationEventHelper: Helper
    {
        public bobjNotificationEvent Select(string id)
        {
            return (bobjNotificationEvent)Mapper().QueryForObject("NotificationEvent.Select", int.Parse(id));
        }

        public IList SelectAll()
        {
            return Mapper().QueryForList("NotificationEvent.Select", null);
        }

        public IList SelectNew()
        {
            return Mapper().QueryForList("NotificationEvent.SelectNew",null);
        }

        public void MarkAsRead(string id)
        {
            Mapper().Update("NotificationEvent.MarkAsRead", int.Parse(id));
        }

        public void Insert(bobjNotificationEvent bobjNotificationEvent)
        {
            Mapper().Insert("NotificationEvent.IUDProcedure", bobjNotificationEvent);
        }

        public int Update(bobjNotificationEvent bobjNotificationEvent)
        {
            return Mapper().Update("NotificationEvent.IUDProcedure", bobjNotificationEvent);
        }

        public int Delete(bobjNotificationEvent bobjNotificationEvent)
        {
            return Mapper().Delete("NotificationEvent.IUDProcedure", bobjNotificationEvent);
        }

     

    }
}