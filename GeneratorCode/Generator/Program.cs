using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Text;

namespace Generator
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main()
        {
            System.AppDomain.CurrentDomain.UnhandledException += new System.UnhandledExceptionEventHandler(GeneratorService.CurrentDomain_UnhandledException);

            if (Properties.Settings.Default.DebugParam_DirectExecute)
            {
                GeneratorService s = new GeneratorService();
                s.timer_Elapsed(null, null);
            }
            else
            {
                ServiceBase[] ServicesToRun;
                ServicesToRun = new ServiceBase[] { new GeneratorService() };
                ServiceBase.Run(ServicesToRun);
            }
        }
    }
}
