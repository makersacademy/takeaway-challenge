package takeaway;

import java.util.ArrayList;
import java.util.List;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.time.Duration;
import java.time.LocalDateTime;

public class Customer {
  private List<Dish> dishes;
  private int phoneNumber;
  private double total;

  public Customer() {
    this.dishes = new ArrayList<>();
    this.phoneNumber = 0;
    this.total = 0;
  }

  // Setter
  public void placeOrder(Dish dish) {
    dishes.add(dish);
  }
  public void setPhoneNumber(int phoneNumber) {
    this.phoneNumber = phoneNumber;
  }
  public void cancelOrder() {
    this.dishes = new ArrayList<>();
    this.total = 0;
    System.out.println("Your order is cancelled. Please enter dish ID or 'q' to exit. 😩");
  }
  private void updateTotal() {
    for (Dish dish : this.dishes) {
      this.total += dish.getPrice();
    }
  }

  // Getter
  public void viewOrder() {
    if (this.dishes.size() == 0) { System.out.println("Your basket is empty. Please enter dish ID or 'q' to exit. 🤦‍♂️"); }
    else {
      for (Dish dish : this.dishes) {
        this.total += dish.getPrice();
        System.out.println(dish);
      }
    
    System.out.printf("Total: £%.2f ~~ Please continue to order or enter 'p' to pay, thank you 🌸%n", total);
    }
    
  }
  public boolean hasOrder() {
    return (this.dishes.size() > 0);
  }

  // To pay
  public void pay() {
    updateTotal();
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm");  
    LocalDateTime thirtyMinsFromNow = LocalDateTime.now().plus(Duration.of(30, ChronoUnit.MINUTES));
    String time = dtf.format(thirtyMinsFromNow);
    System.out.printf("Payment of £%.2f received. Thanks for your purchase today. Your order will arrive by %s (within 30 minutes) and you'll receive a text update on %d - Enjoy! 😄%n", total, time, phoneNumber);
  }
}
