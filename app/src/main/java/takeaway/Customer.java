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
  private double totalSpend;

  public Customer() {
    this.dishes = new ArrayList<>();
    this.phoneNumber = 0;
    this.totalSpend = 0;
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
    resetTotalSpend();
    System.out.println("Your order is cancelled. Please enter dish ID or 'q' to exit. 😩");
  }
  private void updateTotal() {
    resetTotalSpend();
    for (Dish dish : this.dishes) {
      this.totalSpend += dish.getPrice();
    }
  }
  private void resetTotalSpend() {
    this.totalSpend = 0;
  }

  // Getter
  private void displayOrderedDishes() {
    for (Dish dish : this.dishes) {
      System.out.println(dish);
    }
  }
  public void viewOrder() {
    updateTotal();
    
    if (!hasOrder())
      System.out.println("Your basket is empty. Please enter dish ID or 'q' to exit. 🤦‍♂️");
    else {
      displayOrderedDishes();
      System.out.printf("Total: £%.2f ~~ Please continue to order or enter 'p' to pay, thank you 🌸%n", totalSpend);
    }
  }
  public boolean hasOrder() {
    return (this.dishes.size() > 0);
  }

  private String getTimeThirtyMinutesFromNow() {
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm");  
    LocalDateTime thirtyMinsFromNow = LocalDateTime.now().plus(Duration.of(30, ChronoUnit.MINUTES));
    return dtf.format(thirtyMinsFromNow);
  }

  public void pay() {
    updateTotal();
    String time = getTimeThirtyMinutesFromNow();
    System.out.printf("Payment of £%.2f received. Thanks for your purchase today. Your order will arrive by %s (within 30 minutes) and you'll receive a text update on %d - Enjoy! 😄%n", totalSpend, time, phoneNumber);
  }
}
