class Ordering 

  attr_reader :menu, :customers_order, :custmers_order_total, :customers_dish

  def initialize 
    @customers_order = []
    @customers_order_total = 0.0
    @add_up = 0.0
    @menu = [
      { :dish => "Big mac", :price => 3.00},
      { :dish => "Chicken Nuggets", :price => 2.50},
      { :dish => "Chicken Sandwich", :price => 2.00},
      { :dish => "Kids meal", :price => 2.75},
      { :dish => "Diet Coke", :price => 1.25},
      { :dish => "Chips", :price => 1.00} 
    ]
  end 

  def see_menu
    @menu
  end 

  def order(dish)
    @customers_dish = dish
    check_dish_is_on_menu
    @customers_order.push(@customers_dish)
  end 

  def checkout
    add_up_dish_total
    @customers_order_total
  end 

  private

  attr_reader :add_up

  def check_dish_is_on_menu
    if @menu.any? {|a| a[:dish]== @customers_dish}
      return true 
    else 
      raise"ERROR: The dish #{@customers_dish} is not available on the menu"
    end
  end 


  # def add_up_dish_total
  #   @customers_order.each do |customers_dish|
  #     if @menu.any? {|a,b| a[:dish] == customers_dish}
  #       add_up = b
  #       @customers_order_total += add_up
  #     end 
  #   end 
  # end 


  def add_up_dish_total
    @customers_order.each do |customers_dish|
      menu.each do |dish|
        cus_dish = dish[:dish]
        price = dish[:price]
        if cus_dish == customers_dish
            @customers_order_total = @customers_order_total + price 
        end 
      end 
    end 
  end 
end 