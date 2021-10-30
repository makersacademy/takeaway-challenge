# Object Model Diagram
---

## Class
- Customer

## Instance Variable(s)
- List<Dish> dishes
- int phoneNumber
- double total

## Method(s)
- Setters
  - public void placeOrder(Dish dish)
  - public void setPhoneNumber(int phoneNumber)
  - public void cancelOrder()
  - private void updateTotal()

- Getters
  - public void viewOrder()
  - public boolean hasOrder()

- public void pay()
---

## Class
- Menu

## Instance Variable(s)
- List<Dish> dishes

## Method(s)
- Setter
  - public void addDish(Dish dish)

- Getter
  - public List<Dish> getDishes()
---

## Class
- Dish

## Instance Variable(s)
- private int dishId;
- private String name;
- private double price;

## Method(s)
- Setters
  - public void updateId(int dishId)
  - public void updateName(String name)
  - public void updatePrice(String price)

- Getters
  - public int getDishId()
  - public String getName()
  - public double getPrice()

- @Override
  - public String toString()
---

## Class
- Main

## Instance Variable(s)
- n/n

## Method(s)
- n/a
