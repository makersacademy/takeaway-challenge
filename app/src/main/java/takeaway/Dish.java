package takeaway;

public class Dish {
  
  private int dishId;
  private String name;
  private double price;

  public Dish(int dishId, String name, double price) {
    this.dishId = dishId;
    this.name = name;
    this.price = price;
  }

  // Setter
  public void updateId(int dishId) {
    this.dishId = dishId;
  }
  public void updateName(String name) {
    this.name = name;
  }
  public void updatePrice(String price) {
    this.name = price;
  }

  // Getters
  public int getDishId() { return dishId; }
  public String getName() { return name; }
  public double getPrice() { return price; }

  public String toString() {
    return "   " + dishId + ". " + name + "  £" + String.format("%.2f", price);
  }
}
