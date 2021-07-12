namespace com.topdev.aa.data
{
	/// <summary>
	/// Singleton "controller" for Helper classes.
	/// </summary>
	public class Helpers
	{

        private static volatile SubscriberHelper _SubscriberHelper = null;

        public static SubscriberHelper Subscriber()
        {
            if (_SubscriberHelper == null)
            {
                lock (typeof(SubscriberHelper))
                {
                    if (_SubscriberHelper == null) // double-check
                        _SubscriberHelper = new SubscriberHelper();
                }
            }
            return _SubscriberHelper;
        }
        
        
        private static volatile NotificationEventHelper _NotificationEventHelper = null;

        public static NotificationEventHelper NotificationEvent()
        {
            if (_NotificationEventHelper == null)
            {
                lock (typeof(NotificationEventHelper))
                {
                    if (_NotificationEventHelper == null) // double-check
                        _NotificationEventHelper = new NotificationEventHelper();
                }
            }
            return _NotificationEventHelper;
        }


        private static volatile SubscriptionHelper _SubscriptionHelper = null;

        public static SubscriptionHelper Subscription()
        {
            if (_SubscriptionHelper == null)
            {
                lock (typeof(SubscriptionHelper))
                {
                    if (_SubscriptionHelper == null) // double-check
                        _SubscriptionHelper = new SubscriptionHelper();
                }
            }
            return _SubscriptionHelper;
        }


        private static volatile DeviceHelper _DeviceHelper = null;

        public static DeviceHelper Device()
        {
            if (_DeviceHelper == null)
            {
                lock (typeof(DeviceHelper))
                {
                    if (_DeviceHelper == null) // double-check
                        _DeviceHelper = new DeviceHelper();
                }
            }
            return _DeviceHelper;
        }


        private static volatile SubscriptionTypeHelper _SubscriptionTypeHelper = null;

        public static SubscriptionTypeHelper SubscriptionType()
        {
            if (_SubscriptionTypeHelper == null)
            {
                lock (typeof(SubscriptionTypeHelper))
                {
                    if (_SubscriptionTypeHelper == null) // double-check
                        _SubscriptionTypeHelper = new SubscriptionTypeHelper();
                }
            }
            return _SubscriptionTypeHelper;
        }


        private static volatile CommunicationMethodHelper _CommunicationMethodHelper = null;

        public static CommunicationMethodHelper CommunicationMethod()
        {
            if (_CommunicationMethodHelper == null)
            {
                lock (typeof(CommunicationMethodHelper))
                {
                    if (_CommunicationMethodHelper == null) // double-check
                        _CommunicationMethodHelper = new CommunicationMethodHelper();
                }
            }
            return _CommunicationMethodHelper;
        }


        private static volatile NotificationGeneratorHelper _NotificationGeneratorHelper = null;

        public static NotificationGeneratorHelper NotificationGenerator()
        {
            if (_NotificationGeneratorHelper == null)
            {
                lock (typeof(NotificationGeneratorHelper))
                {
                    if (_NotificationGeneratorHelper == null) // double-check
                        _NotificationGeneratorHelper = new NotificationGeneratorHelper();
                }
            }
            return _NotificationGeneratorHelper;
        }


        private static volatile NotificationInformationHelper _NotificationInformationHelper = null;

        public static NotificationInformationHelper NotificationInformation()
        {
            if (_NotificationInformationHelper == null)
            {
                lock (typeof(NotificationInformationHelper))
                {
                    if (_NotificationInformationHelper == null) // double-check
                        _NotificationInformationHelper = new NotificationInformationHelper();
                }
            }
            return _NotificationInformationHelper;
        }

        private static volatile SubscriptionInformationHelper _SubscriptionInformationHelper = null;

        public static SubscriptionInformationHelper SubscriptionInformation()
        {
            if (_SubscriptionInformationHelper == null)
            {
                lock (typeof(SubscriptionInformationHelper))
                {
                    if (_SubscriptionInformationHelper == null) // double-check
                        _SubscriptionInformationHelper = new SubscriptionInformationHelper();
                }
            }
            return _SubscriptionInformationHelper;
        }


        private static volatile EventTypeHelper _EventTypeHelper = null;

        public static EventTypeHelper EventType()
        {
            if (_EventTypeHelper == null)
            {
                lock (typeof(EventTypeHelper))
                {
                    if (_EventTypeHelper == null) // double-check
                        _EventTypeHelper = new EventTypeHelper();
                }
            }
            return _EventTypeHelper;
        }

        private static volatile EventSubscriptionTypeHelper _EventSubscriptionTypeHelper = null;
        public static EventSubscriptionTypeHelper EventSubscriptionType()
        {
            if (_EventSubscriptionTypeHelper == null)
            {
                lock (typeof(EventSubscriptionTypeHelper))
                {
                    if (_EventSubscriptionTypeHelper == null) // double-check
                        _EventSubscriptionTypeHelper = new EventSubscriptionTypeHelper();
                }
            }
            return _EventSubscriptionTypeHelper;
        }

        private static volatile NotificationHelper _NotificationHelper = null;
        public static NotificationHelper Notification()
        {
            if (_NotificationHelper == null)
            {
                lock (typeof(NotificationHelper))
                {
                    if (_NotificationHelper == null) // double-check
                        _NotificationHelper = new NotificationHelper();
                }
            }
            return _NotificationHelper;
        }


        private static volatile LogServiceDistributorHelper _LogServiceDistributorHelper = null;
        public static LogServiceDistributorHelper LogServiceDistributor()
        {
            if (_LogServiceDistributorHelper == null)
            {
                lock (typeof(LogServiceDistributorHelper))
                {
                    if (_LogServiceDistributorHelper == null) // double-check
                        _LogServiceDistributorHelper = new LogServiceDistributorHelper();
                }
            }
            return _LogServiceDistributorHelper;
        }

        private static volatile LogServiceGeneratorHelper _LogServiceGeneratorHelper = null;
        public static LogServiceGeneratorHelper LogServiceGenerator()
        {
            if (_LogServiceGeneratorHelper == null)
            {
                lock (typeof(LogServiceGeneratorHelper))
                {
                    if (_LogServiceGeneratorHelper == null) // double-check
                        _LogServiceGeneratorHelper = new LogServiceGeneratorHelper();
                }
            }
            return _LogServiceGeneratorHelper;
        }

        private static volatile SystemEinstellungenHelper _SystemEinstellungenHelper = null;
        public static SystemEinstellungenHelper SystemEinstellungen()
        {
            if (_SystemEinstellungenHelper == null)
            {
                lock (typeof(SystemEinstellungenHelper))
                {
                    if (_SystemEinstellungenHelper == null) // double-check
                        _SystemEinstellungenHelper = new SystemEinstellungenHelper();
                }
            }
            return _SystemEinstellungenHelper;
        }

        private static volatile AttachmentsHelper _AttachmentsHelper = null;
        public static AttachmentsHelper Attachments()
        {
            if (_AttachmentsHelper == null)
            {
                lock (typeof(AttachmentsHelper))
                {
                    if (_AttachmentsHelper == null) // double-check
                        _AttachmentsHelper = new AttachmentsHelper();
                }
            }
            return _AttachmentsHelper;
        }

        private static volatile NotificationTextHelper _NotificationTextHelper = null;
        public static NotificationTextHelper NotificationText()
        {
            if (_NotificationTextHelper == null)
            {
                lock (typeof(NotificationTextHelper))
                {
                    if (_NotificationTextHelper == null) // double-check
                        _NotificationTextHelper = new NotificationTextHelper();
                }
            }
            return _NotificationTextHelper;
        }
	}
}
