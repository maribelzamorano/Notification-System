using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using com.topdev.aa.data;
using System.Collections;

[WebService(Namespace = "http://com.topdev.notifications/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class Service : System.Web.Services.WebService
{
    public Service () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }


    [WebMethod]
    public string insertSubscriber(bobjSubscriber bobjSubscriber)
    {
        bobjSubscriber UserExists = Helpers.Subscriber().UserExists(bobjSubscriber.userId);
        if (UserExists == null)
        {
            try
            {
                Helpers.Subscriber().Insert(bobjSubscriber);
                return bobjSubscriber.subscriberId;
            }
            catch (Exception e)
            {
                throw new Exception("There was an error while inserting the subscriber: " + e);
            }
        }
        else
        {
            throw new Exception("User already exists");
        }

    }

    [WebMethod]
    public void deleteSubscriber(string SubscriberId)
    {

        bobjSubscriber SubscriberExists = new bobjSubscriber();
        SubscriberExists = Helpers.Subscriber().Select(SubscriberId);
        if (SubscriberExists != null)
        {

            SubscriberExists.actionCode = "90";

            try
            {
                Helpers.Subscriber().Delete(SubscriberExists);
            }
            catch (Exception e)
            {
                throw new Exception("There was an error while deleting the subscriber: " + e);
            }
        }
        else
        {
            throw new Exception("Subscriber does not exists");
        }
    }

    [WebMethod]
    public bobjSubscriber[] getAllSubscribers()
    {
        try
        {
            IList Subscribers = Helpers.Subscriber().SelectAll();
            bobjSubscriber[] Subs = new bobjSubscriber[Subscribers.Count];
            int c = 0;
            foreach (bobjSubscriber d in Subscribers)
            {
                Subs[c] = d;
                c++;
            }
            return Subs;
        }
        catch (Exception e)
        {
            throw new Exception("There was an error while getting the subscribers: " + e);
        }


    }

    [WebMethod]
    public bobjSubscriber getSubscriberById(string SubscriberId)
    {
        try
        {
            bobjSubscriber Subscriber = new bobjSubscriber();
            Subscriber = Helpers.Subscriber().Select(SubscriberId);
            if (Subscriber == null)
            {
                throw new Exception("Subscriber does not exists");
            }
            else
            {
                return Subscriber;
            }
        }
        catch (Exception e)
        {
            throw new Exception("There was an error while getting the subscriber: " + e);
        }

    }

    [WebMethod]
    public string insertSubscription(bobjSubscription bobjSubscription)
    {


        bobjSubscription SubscriptionParameters = Helpers.Subscription().SubscriptionExists(bobjSubscription);
        if (SubscriptionParameters != null)
        {
            throw new Exception("A subscription with the same parameters is already in the database");
        }

        else
        {
            try
            {
                Helpers.Subscription().Insert(bobjSubscription);
                return bobjSubscription.subscriptionId;
            }
            catch (Exception e)
            {
                throw new Exception("There was an error while inserting the subscription: " + e);
            }
        }
    }

    [WebMethod]
    public void updateSubscription(bobjSubscription bobjSubscription)
    {

        bobjSubscription SubscriptionExists = Helpers.Subscription().SelectBySubscriptionId(bobjSubscription.subscriptionId);
        if (SubscriptionExists == null)
        {

            throw new Exception("The Subscription does not exist.");
        }

        else
        {
            bobjSubscription SubscriptionParameters = new bobjSubscription();
            SubscriptionParameters = Helpers.Subscription().SubscriptionExists(bobjSubscription);
            if (SubscriptionParameters == null)
            {
                bobjSubscription.orgUser = SubscriptionExists.orgUser;
                bobjSubscription.orgXPts = SubscriptionExists.orgXPts;

                try
                {
                    Helpers.Subscription().Update(bobjSubscription);
                }
                catch (Exception e)
                {
                    throw new Exception("There was an error while updating the subscription: " + e);
                }
            }
            else
            {
                throw new Exception("A subscription with the same parameters is already in the database");
            }
        }

    }

    [WebMethod]
    public void deleteSubscription(string subscriptionId)
    {

        bobjSubscription SubscriptionExists = Helpers.Subscription().SelectBySubscriptionId(subscriptionId);
        if (SubscriptionExists != null)
        {
            try
            {

                SubscriptionExists.actionCode = "90";

                Helpers.Subscription().Delete(SubscriptionExists);
            }
            catch (Exception e)
            {
                throw new Exception("There was an error while deleting the subscription: " + e);
            }
        }
        else
        {
            throw new Exception("Subscription does not exists");
        }

    }

    [WebMethod]
    public bobjSubscription[] getSubscriptionsBySubscriberId(string SubscriberId)
    {
        bobjSubscriber SubscriberExists = new bobjSubscriber();
        SubscriberExists = Helpers.Subscriber().Select(SubscriberId);
        if (SubscriberExists == null)
        {
            throw new Exception("The subscriber does not exists");
        }
        else
        {
            try
            {

                IList SubscriberSubscriptions = Helpers.Subscription().SelectBySubscriberId(SubscriberId);
                if (SubscriberSubscriptions.Count == 0)
                {
                    throw new Exception("This subscriber has no subscriptions");
                }
                else
                {
                    bobjSubscription[] Subs = new bobjSubscription[SubscriberSubscriptions.Count];
                    int c = 0;
                    foreach (bobjSubscription d in SubscriberSubscriptions)
                    {
                        Subs[c] = d;
                        c++;
                    }

                    return Subs;
                }
            }
            catch (Exception e)
            {
                throw new Exception("There was an error while getting the subscriptions of this subscriber: " + e);
            }
        }

    }


    [WebMethod]
    public bobjSubscription getSubscriptionById(string subscriptionId)
    {
        try
        {
            bobjSubscription sbpn = Helpers.Subscription().SelectBySubscriptionId(subscriptionId);
            if (sbpn == null)
            {
                throw new Exception("There are no subscriptions with this ID");
            }
            return sbpn;
        }
        catch (Exception e)
        {
            throw new Exception("There was an error while reading from the Subscription table.\n" + e);
        }
    }

    [WebMethod]
    public string insertDevice(bobjDevice bobjDevice)
    {
        try
        {
            if (Helpers.Device().Exists(bobjDevice) != null)
            {
                throw new System.Exception("The same device is already registered.");
            }
            Helpers.Device().Insert(bobjDevice);
            return bobjDevice.deviceId;
        }
        catch (Exception e)
        {

            throw new Exception("There was an error while inserting into the Device table. \n" + e);
        }
    }

    [WebMethod]
    public void updateDevice(bobjDevice bobjDevice)
    {
        try
        {
            bobjDevice info = Helpers.Device().Select(int.Parse(bobjDevice.deviceId));
            if (info == null)
            {
                throw new Exception("The device with the specified ID does not exist.");
            }
            if (Helpers.Device().Exists(bobjDevice) != null)
            {
                throw new System.Exception("The same device is already registered.");
            }
            bobjDevice.orgUser = info.orgUser;
            bobjDevice.orgXPts = info.orgXPts;
            Helpers.Device().Update(bobjDevice);
        }
        catch (Exception e)
        {
            throw new Exception("There was an error while updating the Device table.\n" + e);
        }
    }

    [WebMethod]
    public void deleteDevice(int deviceId)
    {
        try
        {
            bobjDevice bobjDevice = Helpers.Device().Select(deviceId);
            if (bobjDevice == null)
            {
                throw new Exception("The device with the specified ID does not exist.");
            }
            bobjDevice.actionCode = "90";
            Helpers.Device().Delete(bobjDevice);
        }
        catch (Exception e)
        {
            throw new Exception("There was an error while deleting from the Device table. \n" + e);
        }

    }

    [WebMethod]
    public bobjDevice[] getDevicesBySubscriberId(int subscriberId)
    {
        try
        {
            IList list = Helpers.Device().Select_Subscriber(subscriberId);
            if (list.Count == 0)
            {
                throw new Exception("There are no devices for this subscriber");
            }

            bobjDevice[] dev = new bobjDevice[list.Count];
            int c = 0;
            foreach (bobjDevice d in list)
            {
                dev[c] = d;
                c++;
            }

            return dev;
        }
        catch (Exception e)
        {
            throw new Exception("There was an error while reading from the Device table.\n" + e);
        }
    }

    [WebMethod]
    public bobjDevice getDeviceById(int deviceId)
    {
        try
        {
            bobjDevice dev = Helpers.Device().Select(deviceId);
            if (dev == null)
            {
                throw new Exception("There are no devices with this ID.");
            }
            return dev;
        }
        catch (Exception e)
        {

            throw new Exception("There was an error while reading from the Device table.\n" + e);
        }
    }

    [WebMethod]
    public bobjSubscriptionType[] getAllSubscriptionTypes()
    {
        try
        {
            IList list = Helpers.SubscriptionType().SelectAll();
            int c = 0;
            bobjSubscriptionType[] sbtp = new bobjSubscriptionType[list.Count];
            foreach (bobjSubscriptionType st in list)
            {
                sbtp[c] = st;
                c++;
            }
            return sbtp;
        }
        catch (Exception e)
        {

            throw new Exception("There was an error while reading from the Subscription Type table.\n" + e);
        }
    }

    [WebMethod]
    public bobjCommunicationMethod[] getAllCommunicationMethods()
    {
        try
        {
            IList list = Helpers.CommunicationMethod().SelectAll();
            int c = 0;
            bobjCommunicationMethod[] cmmd = new bobjCommunicationMethod[list.Count];
            foreach (bobjCommunicationMethod cm in list)
            {
                cmmd[c] = cm;
                c++;
            }
            return cmmd;
        }
        catch (Exception e)
        {
            throw new Exception("There was an error while reading from the Communication Method table.\n" + e);
        }
    }
    
}
