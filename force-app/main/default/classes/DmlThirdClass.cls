public class DmlThirdClass {

    Public Static void myMethod(){
        List<Contact> newConList = new List<Contact>();
        List<Contact> conList = [select firstname, lastname from contact];

     for(Contact cc : conList)
     {

Contact c1 = new Contact(lastname=cc.lastname, firstname=cc.firstname);
insert c1;
} // too many DML statements, hence Limit Reached

for(Contact cc : conList)

{

Contact c1 = new Contact(lastname=cc.lastname, firstname=cc.firstname);

newConList.add(c1);

}

insert newConList; // only 1 DML Statement
    }
}