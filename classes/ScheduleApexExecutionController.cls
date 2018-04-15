public class ScheduleApexExecutionController {
Integer count = 0;
    public String country{get;set;}
     String Day = null;
    public PageReference incrementCounter() {
            count++;
        System.debug('count'+count);
        System.debug('country'+country);
            return null;
    }
       public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('Weekly','Weekly')); 
        options.add(new SelectOption('Monthly','Monthly')); 
        return options; 
    }
           public List<SelectOption> getDay() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('Monday','Monday')); 
        options.add(new SelectOption('Tuesday','Tuesday')); 
        options.add(new SelectOption('Wednesday','Wednesday')); 
        options.add(new SelectOption('Thrusday','Thrusday')); 
         options.add(new SelectOption('Friday','Friday')); 
        options.add(new SelectOption('Saturday','Saturday')); 
        options.add(new SelectOption('Sunday','Sunday')); 
        return options; 
    }
     /* public String getCountry() {
        return country;
    }
                    
    public void setCountry(String country) { this.country = country; }     */
    public String getDayofWeek() {
        return Day;
    }
                    
    public void setDayOfWeek(String Day) { this.Day = Day; } 
    public Integer getCount() {
        return count;
    }
}