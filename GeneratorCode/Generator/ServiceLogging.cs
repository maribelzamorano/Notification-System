using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Generator
{
    public class ServiceLogging
    {
        public static void LogError(Exception ex)
        {
            string str = DateTime.Now.ToString() + ": " + ex.Message + "\r\n";

            if (ex.Source != null)
            {
                str += "Source: " + ex.Source + "\r\n";
            }
            if (ex.StackTrace != null)
            {
                str += "StackTrace: \r\n" + ex.StackTrace + "\r\n\r\n";
            }

            System.IO.File.AppendAllText(GetLogPath() + "\\Generator_ErrorLog.txt", str);
        }

        /// <summary>
        /// Logs some debug information. Use this often!
        /// </summary>
        /// <param name="text"></param>
        public static void LogDebug(string text)
        {
            try
            {
                if (Properties.Settings.Default.DebugParam_DebugOutput)
                {
                    System.IO.File.AppendAllText(GetLogPath() + "\\Generator_DebugLog.txt", DateTime.Now.ToString() + "  " + text + "\r\n");
                }
            }
            catch
            { }
        }

        private static string GetLogPath()
        {
            if (Properties.Settings.Default.LogDir == "{AppDir}")
            {
                return AppDomain.CurrentDomain.BaseDirectory;
            }
            else
            {
                return Properties.Settings.Default.LogDir;
            }
        }
    }
}
