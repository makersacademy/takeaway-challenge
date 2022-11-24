# {{Golden Square Solo Project}} Multi-Class Planned Design Recipe

## Describe the Problem

Here is a project to test your golden square skills overall:

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
> 
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
> 
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.

Use the `twilio-ruby` gem to implement this next one. You will need to use
doubles too.

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and
> will be delivered before 18:52" after I have ordered.

Fair warning: if you push your Twilio API Key to a public Github repository,
anyone will be able to see and use it. What are the security implications of
that? How will you keep that information out of your repository?

## Design the Class System

> Initial mapping out of classes

```
 ┌─────────────────────┐
 │ DishList            │
 ├────────────         │
 │- add(dish)          │
 │                     │
 │- menu               │
 │                     │
 │- selection          │
 │                     │    ┌────────────────┐
 │- receipt(selection) │    │ConfirmOrder    │
 │                     │    ├──────────────  │
 └─────────────────────┘    │                │
             ▲              │ - dependency   │
             │              │   injector     │
   ┌─────────┴────────┐     │                │
   │ Dish(dish, price)│     │ - API request  │
   ├──────────────────┤     │                │
   │- dish            │     │ - confirmation │
   │                  │     │   message      │
   │- price           │     │                │
   │                  │     └────────────────┘
   │- format_dish     │
   │  =>"dish, £price"│
   │                  │
   │- select          │
   │                  │
   │- deselect        │
   │                  │
   │- is_selected?    │
   └──────────────────┘

```

> Class models

```ruby

class DishList
  def initialize
  end

  def add(dish_with_price) # dish_with_price is an instance of Dish
    # Dish gets added to the menu
    # Returns nothing
  end

  def list
    # Returns list of all dishes
  end
  
  def selection
    # returns list of selected dishes
  end

  def receipt
    # takes selection and returns itemised receipt with grand total
  end

  def grand_total
    # calculates grand total
  end
end

Dish = Struct.new(:dish, :price) do
  def is_selected?
    # returns true if dish has been selected
  end

  def format
    # Returns a string in the form "dish, £price"
  end

  def selected
    # formats dish for selection
  end

  def deselect
    # reverse formatting, deselects dish
  end
end

class ConfirmOrder
  def intialize(requester)
    # dependency injector for testing API usage
  end

  def confirmation_message
    # send confirmation message to customer confirming order with time estimate
  end

  def request_to_API
    # make request to API to send message to customer
  end
end

```

## Integration Tests

```ruby

# Gets all dishes

menu = DishList.new
dish_1 = Dish.new("Pizza", 12.00)
dish_2 = Dish.new("Pasta", 11.00)
menu.add(dish_1)
menu.add(dish_2)
menu.list => [dish_1, dish_2]

menu = DishList.new
dish_1 = Dish.new("Pizza", 12.00)
dish_2 = Dish.new("Pasta", 11.00)
dish_3 = Dish.new("Cake", 7.00)
menu.add(dish_1)
menu.add(dish_2)
dish_1.select
dish_2.select
menu.selection => [dish_1, dish_2]

dish_list = DishList.new
dish_1 = Dish.new("pizza", 12.00)
dish_2 = Dish.new("pasta", 12.00)
dish_3 = Dish.new("cake", 12.00)
dish_list.add(dish_1)
dish_list.add(dish_2)
dish_list.add(dish_3)
dish_1.selected
dish_2.selected
dish_2.deselect
dish_3.selected
dish_list.selection => [dish_1, dish_3]

dish_list = DishList.new
dish_1 = Dish.new("pizza", 12.00)
dish_2 = Dish.new("pasta", 12.00)
dish_3 = Dish.new("cake", 12.00)
dish_list.add(dish_1)
dish_list.add(dish_2)
dish_list.add(dish_3)
dish_1.selected
dish_2.selected
dish_list.receipt => ["pizza, £12.00", "pasta, £12.00"]

dish_list = DishList.new
dish_1 = Dish.new("pizza", 12.00)
dish_2 = Dish.new("pasta", 12.00)
dish_3 = Dish.new("cake", 12.00)
dish_list.add(dish_1)
dish_list.add(dish_2)
dish_list.add(dish_3)
dish_1.selected
dish_2.selected
dish_list.receipt => ["pizza, £12.00", "pasta, £12.00", "Total cost: £24.00"]
```

## Unit Tests

```ruby

# Constructs DishList

dish_list = DishList.new
dish_list.list => []

dish_list = DishList.new
dish_list.selection => []

dish_list = DishList.new
dish_1 = double :fake_dish
dish_2 = double :fake_dish
dish_list.add(dish_1)
dish_list.add(dish_2)
dish_list.list => [dish_1, dish_2]

dish_list = DishList.new
dish_1 = double :dish, is_selected?: true
dish_2 = double :dish, is_selected?: true
dish_3 = double :dish, is_selected?: false
dish_list.add(dish_1)
dish_list.add(dish_2)
dish_list.add(dish_3)
dish_list.selection => [dish_1, dish_2]

dish_list = DishList.new
dish_1 = double :dish, is_selected?: true, format: "pizza, £12.00", price: 12.00
dish_2 = double :dish, is_selected?: true, format: "pasta, £12.00", price: 12.00
dish_list.add(dish_1)
dish_list.add(dish_2)
dish_list.receipt => ["pizza, £12.00", "pasta, £12.00", "Total cost: £24.00"]

dish_list = DishList.new
dish_1 = double :dish, is_selected?: true, price: 12.00
dish_2 = double :dish, is_selected?: true, price: 12.00
dish_list.add(dish_1)
dish_list.add(dish_2)
dish_list.grand_totalresult => "Total cost: £24.00"

```

```ruby

# Constructs Dish

dish = Dish.new("pizza", 12.00)
dish.dish => "pizza"

dish = Dish.new("pizza", 12.00)
dish.price => 12.00

dish = Dish.new("pizza", 12.00)
dish.format => "pizza, £12.00"

dish = Dish.new("pizza", 12.00)
dish.selected
dish.is_selected? => true

dish = Dish.new("pizza", 12.00)
dish.is_selected? => false

dish = Dish.new("pizza", 12.00)
dish.selected
dish.deselect => false

```

