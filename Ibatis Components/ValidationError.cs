/// <remarks/>
[System.CodeDom.Compiler.GeneratedCodeAttribute("wsdl", "2.0.50727.42")]
[System.SerializableAttribute()]
[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.ComponentModel.DesignerCategoryAttribute("code")]
[System.Xml.Serialization.XmlTypeAttribute(Namespace = "http://error.object.aa.topdev.com/xsd")]
//[System.Xml.Serialization.XmlTypeAttribute(Namespace = "")]
public partial class ValidationError : ProcessingError
{

    private string key1Field;

    private string text1Field;

    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute("key", IsNullable = true, Order = 0)]
    public string key1
    {
        get
        {
            return this.key1Field;
        }
        set
        {
            this.key1Field = value;
        }
    }

    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute("text", IsNullable = true, Order = 1)]
    public string text1
    {
        get
        {
            return this.text1Field;
        }
        set
        {
            this.text1Field = value;
        }
    }
}

