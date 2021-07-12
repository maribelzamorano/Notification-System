 using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IBatisNet.DataMapper.TypeHandlers;


namespace com.topdev.aa.lib.ibatis
{
    public class StringToInt : ITypeHandlerCallback
    {
        public void SetParameter(IParameterSetter setter, object parameter)
        {
            setter.Value = int.Parse(parameter.ToString());
        }

        public object NullValue 
        {
            get { return "0"; } 
        }

        public object ValueOf(string s)
        {
            return s;
        }

        public object GetResult(IResultGetter getter)
        {
            return "" + getter.Value;
        }


    }
}
