public class myHelloWorld{
public static void applyDiscount(Book__c[] books)
{
for(Book__c b:books)
b.Price__c=0.9*b.Price__c;
}

}