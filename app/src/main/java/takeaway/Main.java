package takeaway;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
  
  public static void main(String[] args) {
    Dish fishAndChips = new Dish(1, "Fish 'n' Chips", 5.99);
    Dish chickenTikka = new Dish(2, "Chicken Tikka", 5.99);
    Dish eggFriedRice = new Dish(3, "Egg Fried Rice", 1.99);
    Dish sausageRoll = new Dish(4, "Sausage Roll", 2);
    Dish veganSausageRoll = new Dish(5, "Vegan Sausage Roll", 2);

    List<Dish> menu = new ArrayList<>();
    menu.add(fishAndChips);
    menu.add(chickenTikka);
    menu.add(eggFriedRice);
    menu.add(sausageRoll);

    Menu fastFoodHut = new Menu(menu);
    fastFoodHut.addDish(veganSausageRoll);

    System.out.println(
      "-----------------------------------" +
      "\n    Welcome to Fast Food Hut!" +
      "\n  Please select from the menu: 🦐" +
      "\n-----------------------------------"
    );

    // Print menu
    for (int i = 0; i < menu.size(); i++) {
      System.out.println(menu.get(i));
    }

    // Print instructions for customer
    System.out.println(
      "-----------------------------------" +
      "\n* To place an order, enter dish ID" +
      "\n* To view order, enter 'v'" +
      "\n* To cancel and start again, enter 'c'" +
      "\n* To exit, enter 'q'"
    );

    // Create customer object ready to place order
    Customer customer = new Customer();
    
    // Receive instructions from customer
    Scanner orderIn = new Scanner(System.in);
    String viewOrder = "v";
    String cancel = "c";
    String exit = "q";
    String pay = "p";
    while (true) {
      String order = orderIn.nextLine();
      if (order.equals(exit)) {
        System.out.println("Bye Bye 👋");
        break;
      }
      else if (order.equals(pay) && customer.hasOrder()) { 
        System.out.println("Please provide phone number for text updates on delivery 🤙");
        Scanner phoneNumberIn = new Scanner(System.in);
        int phoneNumber = phoneNumberIn.nextInt();
        customer.setPhoneNumber(phoneNumber);
        customer.pay();
        break;
      }
      else if (order.equals(pay) && !customer.hasOrder()) { 
        System.out.println("Your basket is empty. Please enter dish ID or 'q' to exit. 🤦‍♂️");
      }
      else if (order.equals(cancel)) { customer.cancelOrder(); }
      else if (order.equals(viewOrder)) { customer.viewOrder(); }
      else if (order.equals("1")) { customer.placeOrder(fishAndChips); }
      else if (order.equals("2")) { customer.placeOrder(chickenTikka); }
      else if (order.equals("3")) { customer.placeOrder(eggFriedRice); }
      else if (order.equals("4")) { customer.placeOrder(sausageRoll); }
      else if (order.equals("5")) { customer.placeOrder(veganSausageRoll); }
      else { System.out.println("Please enter correctly. 🙏"); }
    }
  }
}
