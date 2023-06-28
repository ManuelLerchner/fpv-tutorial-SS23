import map.IntIntMap;
import map.IntOrderedPrintable;
import map.IntStringMap;
import map.StringPrintable;

public class MapDemo {

      public static void main(String[] args) {
            System.out.println("#Int-String-Map demo\n");
            int_string_demo(args);

            System.out.println("\n#Int-Int-Map demo\n");
            int_int_demo(args);
      }

      public static void int_string_demo(String[] args) {
            var my_map = new IntStringMap();

            my_map.set(new IntOrderedPrintable(1), new StringPrintable("one"));
            my_map.set(new IntOrderedPrintable(2), new StringPrintable("two"));
            my_map.set(new IntOrderedPrintable(3), new StringPrintable("three"));

            System.out.println("##Printing the map");

            System.out.println(my_map.to_string());

            System.out.println("##Getting elements from the map");

            System.out.println("searching for 2: " + my_map.get(new IntOrderedPrintable(2)).t);
      }

      // ##Printing the map
      // { 1 -> "one", 2 -> "two", 3 -> "three" }
      // ##Getting elements from the map
      // searching for 2: two

      public static void int_int_demo(String[] args) {
            var my_map = new IntIntMap();

            my_map.set(new IntOrderedPrintable(1), new IntOrderedPrintable(5));
            my_map.set(new IntOrderedPrintable(2), new IntOrderedPrintable(23));
            my_map.set(new IntOrderedPrintable(3), new IntOrderedPrintable(62));

            System.out.println("##Printing the map");

            System.out.println(my_map.to_string());

            System.out.println("##Getting elements from the map");

            System.out.println("searching for 2: " + my_map.get(new IntOrderedPrintable(2)).t);
      }

      // ##Printing the map
      // { 1 -> 5, 2 -> 23, 3 -> 62 }
      // ##Getting elements from the map
      // searching for 2: 23
}