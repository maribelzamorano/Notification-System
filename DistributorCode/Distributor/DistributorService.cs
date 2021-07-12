using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Timers;
using com.topdev.aa.data;


namespace Distributor
{
    public partial class DistributorService : ServiceBase
    {
        Timer timer;
        public DistributorService()
        {
            this.ServiceName = "DistributorService";
            InitializeComponent();
            //The time can be set on the app.config file
            //it's mulitiplied by 60000 to specify minutes
            timer = new Timer(Properties.Settings.Default.ActivationPeriod * 60000);
            timer.Elapsed += new ElapsedEventHandler(timer_Elapsed);
        }
        public void timer_Elapsed(object sender, ElapsedEventArgs e)
        {
            //Run every 15 min
            ServiceLogging.LogDebug("Starting run.");
            bobjLogServiceDistributor LogServiceDistributor = new bobjLogServiceDistributor();
            LogServiceDistributor.logServiceDistributorStartTime = "" + DateTime.Now.Year + "-" +
                (DateTime.Now.Month.ToString().Length == 1 ? ("0" + DateTime.Now.Month) : DateTime.Now.Month.ToString()) + "-" +
                (DateTime.Now.Day.ToString().Length == 1 ? ("0" + DateTime.Now.Day) : DateTime.Now.Day.ToString()) +
                " " + DateTime.Now.Hour + ":" + DateTime.Now.Minute + ":" + DateTime.Now.Second + "." + DateTime.Now.Millisecond;
            try
            {
                ServiceLogging.LogDebug("Starting generator methods.");
                Distributor.Start();
                LogServiceDistributor.logServiceDistributorRc = "0";
            }
            catch (Exception ex)
            {
                LogServiceDistributor.logServiceDistributorRc = "-1";
                LogServiceDistributor.logServiceDistributorRcText = "" + ex;
                ServiceLogging.LogError(ex);
            }
            finally
            {
                LogServiceDistributor.logServiceDistributorEndTime = "" + DateTime.Now.Year + "-" +
                (DateTime.Now.Month.ToString().Length == 1 ? ("0" + DateTime.Now.Month) : DateTime.Now.Month.ToString()) + "-" +
                (DateTime.Now.Day.ToString().Length == 1 ? ("0" + DateTime.Now.Day) : DateTime.Now.Day.ToString()) +
                " " + DateTime.Now.Hour + ":" + DateTime.Now.Minute + ":" + DateTime.Now.Second + "." + DateTime.Now.Millisecond;
                LogServiceDistributor.logServiceDistributorId = "0";
                LogServiceDistributor.user = "user";
                LogServiceDistributor.orgUser = "user";
                LogServiceDistributor.orgXPts = "xpts";
                Helpers.LogServiceDistributor().Insert(LogServiceDistributor);
            }

        }

        protected override void OnStart(string[] args)
        {
            timer.Start();
            ServiceLogging.LogDebug("Starting service.");
        }

        protected override void OnStop()
        {
            timer.Stop();
            ServiceLogging.LogDebug("Stopping service.");
        }

        public static void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
        {
            try
            {
                ServiceLogging.LogError((Exception)e.ExceptionObject);
            }
            catch
            {
                throw (Exception)e.ExceptionObject;
            }
        }
    }
}
