using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Xml;
using com.topdev.aa.data;

namespace Generator
{
    public class Generator
    {
        /// <summary>
        /// Starts the Generator
        /// </summary>
        public static void Start()
        {
            ServiceLogging.LogDebug("Reading new Notification Events");
            IList ListEvent = Helpers.NotificationEvent().SelectNew(); //read new events

            ServiceLogging.LogDebug("Scanning read notification events "+ListEvent.Count);
            foreach (bobjNotificationEvent NotificationEvent in ListEvent) //read the event list event by event
            {
            
                ServiceLogging.LogDebug("Check if it is a direct notification");
                if (NotificationEvent.notificationEventDirectInformation != null)
                {
                    GenerateDirect(NotificationEvent);
                }

                else
                if (NotificationEvent.userId != null) //check if the user id is on the is on the table entry for the notification event
                {
                    ServiceLogging.LogDebug("User id was specified");
                    //reads the subscription table using a where that selects the subscriptions by user id and event type
                    IList ListSubscription = Helpers.SubscriptionInformation().SelectUser(NotificationEvent); 
                    Generate(NotificationEvent, ListSubscription);
                }
                else
                {
                    ServiceLogging.LogDebug("User id was not specified");
                    //reads all the subscription by event type
                    IList ListSubscription = Helpers.SubscriptionInformation().Select(NotificationEvent.eventTypeCode);
                    Generate(NotificationEvent, ListSubscription);
                }

                Helpers.NotificationEvent().MarkAsRead(NotificationEvent.notificationEventId);
            }

        }

        /// <summary>
        /// Generates the sql query necessary for comparing the subscription with the business table
        /// and calls the stored procedure that is used to compare and to insert in the table
        /// </summary>
        /// <param name="NotificationEvent"></param>
        /// <param name="ListSubscription"></param>
        public static void Generate(bobjNotificationEvent NotificationEvent, IList ListSubscription)
        {

            ServiceLogging.LogDebug("Starting Generate().");
            //Reads the subscriptions supplied by the "Start()" method one by one
            foreach (bobjSubscriptionInformation Subscription in ListSubscription)
            {
                //The xml fields are transformed into lists of the bobjXmlData object
                ServiceLogging.LogDebug("Creating parameter list");
                IList ParameterList = GetXmlParameters(Subscription.subscriptionParameters);

                ServiceLogging.LogDebug("Creating condition list");
                IList ConditionList = GetXmlParameters(Subscription.subscriptionTypeConditions);

                ServiceLogging.LogDebug("Creating field list");
                IList FieldList = GetXmlParameters(Subscription.subscriptionTypeFields);

                //the fields must go into a string called Fields
                string Fields = "";

                //The first field is added so the rest of the fields can be added by a for loop
                //that adds a coma in the beginning
                ServiceLogging.LogDebug("Adding fields "+FieldList.Count);
                Fields = ((bobjXmlData)FieldList[0]).name;
                if (FieldList.Count > 1)
                {  
                    for (int x = 1; x != FieldList.Count; x++)
                    {
                        Fields += "," + ((bobjXmlData)FieldList[x]).name;
                    }

                }

                //If there is extra information in the NFEV_INFORMATION field of the Notification Event table
                //this information will be added to the generated query so it can be added along the rest of the information
                //to the xml in the notification table
                ServiceLogging.LogDebug("Adding NFEV_INFORMATION as fields");
                if (NotificationEvent.notificationEventInformation != null 
                    && NotificationEvent.notificationEventInformation.Trim() != ""
                    && NotificationEvent.notificationEventInformation.Trim() != null)
                {
                    //This information is also passed into a list
                    IList NotificationEventInformationList = GetXmlParameters(NotificationEvent.notificationEventInformation);
                    foreach (bobjXmlData NotfInfo in NotificationEventInformationList)
                    {
                        Fields += "," + "'" + NotfInfo.value + "'" + " as " + "'" + NotfInfo.name + "'";
                    }
                }


                //the query is generated
                ServiceLogging.LogDebug("Creating base query");
                string Query = "Select " + Fields + " from " + Subscription.businessTableName
                             + " where " + Subscription.bussinesTableId + " = " + NotificationEvent.eventId;

                //the parameters are added to a where string
                ServiceLogging.LogDebug("Creating where");
                string where = "";
                foreach (bobjXmlData Parameter in ParameterList)
                {
                    //a parameter is sent along the condition list to the GetWhere method
                    where += GetWhere(Parameter, ConditionList);

                }

                //The object that contains the parameters necessary for calling the stored procedure
                //that compares and insert into the notification table is created
                bobjNotificationGenerator Ng = new bobjNotificationGenerator();
                Ng.subscriptionId = Subscription.subscriptionId;
                Ng.notificationEventId = NotificationEvent.notificationEventId;
                Ng.query = Query+where;
                ServiceLogging.LogDebug("QUERY= "+Ng.query);
                //The stored procedure is called
                Helpers.NotificationGenerator().Generate(Ng);
            }
        }

        public static void GenerateDirect(bobjNotificationEvent NotificationEvent)
        {
            ServiceLogging.LogDebug("Starting GenerateDirect().");
            string select = null;
            //Checks if the field NFEV_INFORMATION is not null.
            if (NotificationEvent.notificationEventInformation != null
                && NotificationEvent.notificationEventInformation.Trim() != ""
                && NotificationEvent.notificationEventInformation.Trim() != null)
            {
                //Gets the xml information.
                IList NotificationEventInformationList = GetXmlParameters(NotificationEvent.notificationEventInformation);

                ServiceLogging.LogDebug("Adding NFEV Information as fields");
                //Makes a select statement with the fields obtained.
                select += "select '" + ((bobjXmlData)NotificationEventInformationList[0]).value + "'" + " as " + "'" +
                    ((bobjXmlData)NotificationEventInformationList[0]).name + "'";
                
                //In case there is more than one field adds commas.
                if (NotificationEventInformationList.Count > 1)
                {
                    for (int x = 1; x != NotificationEventInformationList.Count; x++)
                    {
                        select += ", '" + ((bobjXmlData)NotificationEventInformationList[x]).value + "'" + " as " + "'" +
                            ((bobjXmlData)NotificationEventInformationList[x]).name + "'";
                    }
                }
            }
            else 
            {
                select = "select '1' as '1'";
            }

            bobjNotificationGenerator Ng = new bobjNotificationGenerator();
            Ng.notificationEventId = NotificationEvent.notificationEventId;
            Ng.query = select;
            ServiceLogging.LogDebug("QUERY= " + Ng.query);
            //The generator stored procedure is called
            Helpers.NotificationGenerator().Generate(Ng);

        }

        /// <summary>
        /// Separates the contents of the xml fields
        /// into different variables of the bobjXmlData object
        /// </summary>
        /// <param name="xml"></param>
        /// <returns></returns>
        public static IList GetXmlParameters(string xml)
        {
            ServiceLogging.LogDebug("GetXmlParameters()");
            XmlDocument xDoc = new XmlDocument();

            xDoc.LoadXml(xml);
            //necessary commands for scanning the xml data
            XmlNodeList XmlData = xDoc.GetElementsByTagName("xmldata");
            XmlNodeList List = ((XmlElement)XmlData[0]).GetElementsByTagName("data");
            IList XmlList = new List<bobjXmlData>();
            for (int i = 0; i < List.Count; i++)
            {

                XmlAttributeCollection xmlattrc = List[i].Attributes;
                bobjXmlData Node = new bobjXmlData();

                //all the attributes of the xml data are read and added into the bobjXmlData object
                foreach (XmlAttribute xmlattr in xmlattrc)
                {
                    if (xmlattr.Name == "name")
                        Node.name = xmlattr.Value;
                    if (xmlattr.Name == "value")
                        Node.value = xmlattr.Value;
                    if (xmlattr.Name == "dbcolumn")
                        Node.dbcolumn = xmlattr.Value;
                    if (xmlattr.Name == "operator")
                        Node.@operator = xmlattr.Value;
                    if (xmlattr.Name == "format")
                        Node.format = xmlattr.Value;
                }
                //and then added into the list
                XmlList.Add(Node);

            }

            return XmlList;
        }

        /// <summary>
        /// Generates the where necessary for the comparison between the business table
        /// and the parameters supplied by the subscriber
        /// </summary>
        /// <param name="Parameter"></param>
        /// <param name="ConditionList"></param>
        /// <returns></returns>
        public static string GetWhere(bobjXmlData Parameter, IList ConditionList)
        {
            ServiceLogging.LogDebug("GetWhere()");
            string @operator = "";
            //the condition list is scanned
            foreach (bobjXmlData Condition in ConditionList)
            {
                //when the condition matches the parameter the operator is saved in a variable
                //and the value is set on the format attribute of the parameter
                if (Condition.name == Parameter.name)
                {
                    ServiceLogging.LogDebug(""+Condition.name+" "+Parameter.name+" "+Condition.@operator);
                    @operator = Condition.@operator;
                    Parameter.value = Condition.format.Replace("#1#", "'" + Parameter.value + "'");
                    return "\n and " + Condition.dbcolumn + " " + @operator + " " + Parameter.value;
                }
            }
            //returns the generated condition
            return "";
        }
    }
}
