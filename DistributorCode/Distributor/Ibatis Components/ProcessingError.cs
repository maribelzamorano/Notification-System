[System.Xml.Serialization.XmlIncludeAttribute(typeof(ValidationError))]
[System.CodeDom.Compiler.GeneratedCodeAttribute("wsdl", "2.0.50727.42")]
[System.SerializableAttribute()]
[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.ComponentModel.DesignerCategoryAttribute("code")]
[System.Xml.Serialization.XmlTypeAttribute(Namespace = "http://error.object.aa.topdev.com/xsd")]
//[System.Xml.Serialization.XmlTypeAttribute(Namespace = "")]
public partial class ProcessingError
{

    private object exceptionField;

    private string keyField;

    private string textField;

    private string valueField;

    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable = true, Order = 0)]
    public object exception
    {
        get
        {
            return this.exceptionField;
        }
        set
        {
            this.exceptionField = value;
        }
    }

    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable = true, Order = 1)]
    public string key
    {
        get
        {
            return this.keyField;
        }
        set
        {
            this.keyField = value;
        }
    }

    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable = true, Order = 2)]
    public string text
    {
        get
        {
            return this.textField;
        }
        set
        {
            this.textField = value;
        }
    }

    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable = true, Order = 3)]
    public string value
    {
        get
        {
            return this.valueField;
        }
        set
        {
            this.valueField = value;
        }
    }
}

