public class Contacthandler {
    public static list<Contact> fetchcontactdetail(){
        list<contact> conlist=[SELECT ID,LastName FROM CONTACT limit 10];
        return conlist;
    }

}