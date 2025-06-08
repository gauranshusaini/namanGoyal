public class bajajClass {
    public String name{get;set;}
    public Integer rollNo{get;set;}
    public String bikeName{get;set;}
    public Decimal bikePrice{get;set;}
    public Boolean showStudentInfo{get;set;}
     public Boolean showBikeInfo{get;set;}
    
    public bajajClass(){
        name='Gauranshu';
    }
    public  void firstMethod(){
        name='Ravi';
        rollNo=1234567;
        showStudentInfo=true;
        showBikeInfo=false;
    }
    public void bikeInfo(){
        bikeName='FZ-S';
        bikePrice=200000;
        showStudentInfo=false;
        showBikeInfo=true;
    }

}