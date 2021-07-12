
using System.Collections;

namespace com.topdev.aa.data
{
    /// <summary>
    /// Helper class for NotificationEvent entities.
    /// </summary>
    public class NotificationHelper: Helper
    {
        public void MarkAsSent(string id)
        {
            Mapper().Update("Notification.MarkAsSent", int.Parse(id));
        }

    }
}