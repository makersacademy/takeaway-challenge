class Ordering 

  attr_reader :menu, :customers_order, :custmers_order_total, :customers_dish

  def initialize 
    @customers_order = []
    @custmers_order_total = 0
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
    @custmers_order_total
  end 

  private

  def check_dish_is_on_menu
    if @menu.any? {|a| a[:dish]== @customers_dish}
      return true 
    else 
      raise"ERROR: The dish #{@customers_dish} is not available on the menu"
    end
  end 

  def add_up_dish_total
    @customers_order.each do |a|
      @menu.each do |key, value|
        if a == key
          @custmers_order_total += value.to_i
        end 
      end 
    end 
  end 
end 


    # add_up = @menu.fetch(a :dish)
# 
    # @custmers_order_total + add_up   
  # if @menu.any? {|a| a[:dish] == customers_dish}
  # menu