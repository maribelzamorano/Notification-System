using System.Collections;

namespace com.topdev.aa.data
{

    public class LogServiceGeneratorHelper : Helper
    {
        public bobjLogServiceGenerator Select(string id)
        {
            return (bobjLogServiceGenerator)Mapper().QueryForObject("LogServiceGenerator.Select", int.Parse(id));
        }

        public IList SelectAll()
        {
            return Mapper().QueryForList("LogServiceGenerator.Select", null);
        }


        public void Insert(bobjLogServiceGenerator bobjLogServiceGenerator)
        {
            bobjLogServiceGenerator.actionCode = "10";
            Mapper().Insert("LogServiceGenerator.IUDProcedure", bobjLogServiceGenerator);
        }

        public int Update(bobjLogServiceGenerator bobjLogServiceGenerator)
        {
            bobjLogServiceGenerator.actionCode = "20";
            return Mapper().Update("LogServiceGenerator.IUDProcedure", bobjLogServiceGenerator);
        }

        public int Delete(bobjLogServiceGenerator bobjLogServiceGenerator)
        {
            bobjLogServiceGenerator.actionCode = "90";
            return Mapper().Delete("LogServiceGenerator.IUDProcedure", bobjLogServiceGenerator);
        }

    }
}