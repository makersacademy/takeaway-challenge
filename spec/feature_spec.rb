require 'customer_order'

feature 'Feature Integration test - Dishes -> Menus -> CustomerOrder -> Verify ' do

  scenario 'Ordering Food and receiving confirmation' do
    create_entities
    add_dishes_to_menus
    print_the_menu
    remove_some_dishes_from_the_menu
    print_the_menu_again
    add_dishes_to_customer_order
    update_the_order
    customer_verifies_their_total
    add_more_dishes_to_customer_order
    update_the_order_again
    customer_verifies_their_total_again
    send_a_text_confirmation
  end

  def create_entities
    @fruit_b = Dish.new('Fruit Basket', 10.99)
    @eggs_b = Dish.new('Eggs Bennedict', 11.99)
    @salad_n = Dish.new("Salad Nicoise", 10.99)
    @lobser_t = Dish.new("Lobster Thermidore", 28.00)
    @s_chicken = Dish.new("Sweet & Sour Chicken", 9.99)
    @c_beef = Dish.new("Chilli Beef", 12.99)
    @peter_griffin = CustomerOrder.new('07787654321', 'Peter Griffin')
    @menu = Menu.new([@c_beef.present, @s_chicken.present])
  end

  def add_dishes_to_menus
    expect { @menu.add(@lobser_t, @fruit_b, @eggs_b, @salad_n) }.
    to change { @menu.list_of_dishes.count }.from(2).to(6)
  end

  def print_the_menu
    list = "Chilli Beef - £12.99\nSweet & Sour Chicken - £9.99\nLobster Thermidore - £28.0\nFruit Basket - £10.99\nEggs Bennedict - £11.99\nSalad Nicoise - £10.99"
    expect(@menu.print_list).to eq list
  end

  def remove_some_dishes_from_the_menu
    expect { @menu.remove(@fruit_b, @eggs_b) }.
    to change { @menu.list_of_dishes.count }.from(6).to(4)
  end

  def print_the_menu_again
    list = "Chilli Beef - £12.99\nSweet & Sour Chicken - £9.99\nLobster Thermidore - £28.0\nSalad Nicoise - £10.99"
    expect(@menu.print_list).to eq list
  end

  def add_dishes_to_customer_order
    expect { @peter_griffin.add(@salad_n, @lobser_t) }.
    to change { @peter_griffin.order_count }.from(0).to(2)
  end

  def update_the_order
    result = ["Dish: Salad Nicoise Price: £10.99, Quantity: 1\nDish: Lobster Thermidore Price: £28.00, Quantity: 1\n", "Dish: Salad Nicoise Price: £10.99, Quantity: 1\nDish: Lobster Thermidore Price: £28.00, Quantity: 1\n2 Dishes. Total: £38.99", 38.99]
    expect(@peter_griffin.process).to eq result
  end

  def customer_verifies_their_total
    expect { @peter_griffin.cross_check_total }.not_to raise_error
  end

  def add_more_dishes_to_customer_order
    expect { @peter_griffin.add(@lobser_t, @s_chicken, @c_beef) }.
    to change { @peter_griffin.order_count }.from(2).to(5)
  end

  def update_the_order_again
    result = ["Dish: Salad Nicoise Price: £10.99, Quantity: 1\nDish: Lobster Thermidore Price: £28.00, Quantity: 2\nDish: Sweet & Sour Chicken Price: £9.99, Quantity: 1\nDish: Chilli Beef Price: £12.99, Quantity: 1\n", "Dish: Salad Nicoise Price: £10.99, Quantity: 1\nDish: Lobster Thermidore Price: £28.00, Quantity: 2\nDish: Sweet & Sour Chicken Price: £9.99, Quantity: 1\nDish: Chilli Beef Price: £12.99, Quantity: 1\n5 Dishes. Total: £89.97", 89.97]
    expect(@peter_griffin.process).to eq result
  end

  def customer_verifies_their_total_again
    expect { @peter_griffin.cross_check_total }.not_to raise_error
  end

  def send_a_text_confirmation
    # @peter_griffin.complete_and_send_text
  end

end
