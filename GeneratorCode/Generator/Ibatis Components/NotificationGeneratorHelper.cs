using System.Collections;

namespace com.topdev.aa.data
{
    /// <summary>
    /// Helper class for NotificationGenerator entities.
    /// </summary>
    public class NotificationGeneratorHelper: Helper
    {

        public void Generate(bobjNotificationGenerator NotificationGenerator)
        {
            Mapper().Insert("NotificationGenerator.Generate", NotificationGenerator);
        }


    }
}