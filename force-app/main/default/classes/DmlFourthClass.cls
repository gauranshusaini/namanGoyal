public class DmlFourthClass {
      public static void myMethod()
      {
          //*******Upsert*******//
          //Update the name of existingproducts and insert some new ones 
          
          List<Product2> prodList=[Select Name FRom Product2];
          for (product2 p: prodlist)
          {
              p.Name=p.name+'22';
          }
          
          Product2 p1 = new product2 (Name='LAPTOP 21');
          Product2 p2 = new product2 (Name='LAPTOP 31');
          prodList.add(p1);
          prodList.add(p2);
          upsert ProdList;
      }
}