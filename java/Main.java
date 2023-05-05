import extra.CustomRandom.CustomRandom;

public class Main{
   public static void main(String[] args) throws Exception{
      System.out.println("Hello world");
      while(true){
         Thread.sleep(1000);
         System.out.println(CustomRandom.getInstance().rnDouble(10, 20));
      }
   }
}
