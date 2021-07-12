
using System.Collections;

namespace com.topdev.aa.data
{
    /// <summary>
    /// Helper class for SystemEinstellungenEvent entities.
    /// </summary>
    public class SystemEinstellungenHelper : Helper
    {
        public string SelectServer()
        {
            return (string)Mapper().QueryForObject("SystemEinstellungen.SelectServer", null);
        }

        public string SelectUser()
        {
            return (string)Mapper().QueryForObject("SystemEinstellungen.SelectUser", null);
        }

        public string SelectPassw()
        {
            return (string)Mapper().QueryForObject("SystemEinstellungen.SelectPassw", null);
        }


    }
}