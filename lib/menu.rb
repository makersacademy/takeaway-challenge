class Menu
  DISHES = {
    1 => { name: 'Southern fried chicken', price: 9.00 },
    2 => { name: 'Chicken-skin fries', price: 3.00 }
  }

  def initialize(dish_class:)
    @dish_class = dish_class

    create_dishes
  end

  def create_dishes
    @dishes = {}

    DISHES.each do |number, dish|
      @dishes[number] = @dish_class.new(
        name: dish[:name], 
        price: dish[:price]
      )
    end
  end

  def display_menu
    @dishes.each do |number, dish|
      display_dish(number, dish)
    end
  end

  def display_dish(number, dish)
    dish_price = '%.2f' % dish.price
    dish_as_string = "#{number}. "\
      "#{dish.name} - £#{dish_price}"
    puts dish_as_string
  end

  def select(dish_no:)
    @dishes[dish_no]
  end

  private :display_dish
end
