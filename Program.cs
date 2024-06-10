// See https://aka.ms/new-console-template for more information
using System.Xml;
using System.Xml.Xsl;
using xmltoabl;

Xslt();

void Xslt()
{
    XslCompiledTransform xslt = new XslCompiledTransform();
    xslt.Load("C:\\local_sourcecode\\xmlToAbl\\Transform.xslt");

    // var xmlFile = "C:\\local_sourcecode\\xmlToAbl\\20240322827_09_Delta.xml";
    var xmlFile = "C:\\local_sourcecode\\xmlToAbl\\output (5).xml";

    using (XmlReader reader = XmlReader.Create(xmlFile))
    {

        XmlWriterSettings settings = new XmlWriterSettings();
        settings.ConformanceLevel = ConformanceLevel.Auto;

        using (XmlWriter writer = XmlWriter.Create("output.txt", settings))
        {
            var argumentList = new XsltArgumentList();
            argumentList.AddExtensionObject("urn:my-xsltHelper", new XsltHelper());

            // Transform the XML file.
            xslt.Transform(reader, argumentList, writer);
        }
    }

    Console.WriteLine(File.ReadAllText("output.txt"));
    Console.ReadLine();
}

void HardCoded()
{
    XmlDocument doc = new XmlDocument();
    doc.Load("C:\\local_sourcecode\\xmlToAbl\\output (1) (1).xml");
    XmlNamespaceManager nsmgr = new XmlNamespaceManager(doc.NameTable);
    nsmgr.AddNamespace("ws", "urn:com.workday/workersync");
    XmlNode workerSyncNode = doc.SelectSingleNode("//ws:Worker_Sync", nsmgr);

    if (workerSyncNode != null)
    {
        foreach (XmlNode childNode in workerSyncNode.ChildNodes)
        {
            Console.WriteLine(childNode.Name);
        }
    }
}