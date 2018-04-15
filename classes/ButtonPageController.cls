public class ButtonPageController {
     public Blob renderingService { get; private set; }
    public PageReference redirect()
    {
        PageReference pr = new PageReference('/apex/PDFConvertor');
        return pr;
        /*PageReference pr = new PageReference('/apex/PDFConvertor');
        pr.getContentAsPDF();
        return null;*/
    }
    public PageReference saveToPdf() {
         PageReference pr = new PageReference('/apex/PDFConvertor');
      
        renderingService =   pr.getContentAsPDF();
        return pr;
    }
}