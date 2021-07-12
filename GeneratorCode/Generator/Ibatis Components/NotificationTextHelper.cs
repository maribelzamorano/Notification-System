using System.Collections;

namespace com.topdev.aa.data
{
    public class NotificationTextHelper : Helper
    {
        public bobjNotificationText Select(string id)
        {
            return (bobjNotificationText)Mapper().QueryForObject("NotificationText.Select", id);
        }

        public IList SelectAll()
        {
            return Mapper().QueryForList("NotificationText.Select", null);
        }

        public void Insert(bobjNotificationText NotificationText)
        {
            NotificationText.actionCode = "10";
            Mapper().Insert("NotificationText.IUDProcedure", NotificationText);
        }

        public int Update(bobjNotificationText NotificationText)
        {
            NotificationText.actionCode = "20";
            return Mapper().Update("NotificationText.IUDProcedure", NotificationText);
        }

        public int Delete(bobjNotificationText NotificationText)
        {
            NotificationText.actionCode = "90";
            return Mapper().Delete("NotificationText.IUDProcedure", NotificationText);
        }



    }
}