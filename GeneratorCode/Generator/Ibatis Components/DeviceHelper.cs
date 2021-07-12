
using System.Collections;

namespace com.topdev.aa.data
{
    /// <summary>
    /// Helper class for Device entities.
    /// </summary>
    public class DeviceHelper: Helper
    {
        public bobjDevice Select(int id)
        {
            return (bobjDevice)Mapper().QueryForObject("Device.Select", id);
        }

        public bobjDevice Exists(bobjDevice bobjDevice)
        {
            return (bobjDevice)Mapper().QueryForObject("Device.Exists", bobjDevice);
        }

        public IList Select_Subscriber (int id)
        {
            return Mapper().QueryForList("getDeviceBySubscriberId", id);
        }

        public IList SelectAll()
        {
            return Mapper().QueryForList("Device.Select", null);
        }

        public bobjDevice Insert(bobjDevice bobjDevice)
        {
            bobjDevice.actionCode = "10";
            return (bobjDevice)Mapper().Insert("Device.IUDProcedure",bobjDevice);
        }

        public int Update(bobjDevice bobjDevice)
        {
            bobjDevice.actionCode = "20";
            return Mapper().Update("Device.IUDProcedure", bobjDevice);
        }

        public int Delete(bobjDevice bobjDevice)
        {
            bobjDevice.actionCode = "90";
            return Mapper().Delete("Device.IUDProcedure", bobjDevice);
        }

    }
}