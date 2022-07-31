package takeaway;

import java.util.List;

public class Menu {
  
  private List<Dish> dishes;

  public Menu(List<Dish> dishes) {
    this.dishes = dishes;
  }

  // Setter
  public void addDish(Dish dish) {
    dishes.add(dish);
  }

  // Getter
  public List<Dish> getDishes() { return dishes; }
}
