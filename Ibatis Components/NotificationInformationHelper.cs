using System.Collections;

namespace com.topdev.aa.data
{
    /// <summary>
    /// Helper class for NotificationInformation entities.
    /// </summary>
    public class NotificationInformationHelper: Helper
    {

        public IList SelectAll()
        {
            return Mapper().QueryForList("NotificationInformation.Select", null);
        }

    }
}