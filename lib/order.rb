require "./lib/menu"

class Order
  attr_reader :current_items, :basket_sum

  def initialize(menu = Menu.new.full_menu)
    @current_items = { }
    @menu = menu
  end 

  def add_item(item, quantity) 
    current_number = quantity 
    value =  @current_items[item] 
    if @current_items[item] == nil
      @current_items[item] = current_number
    else 
      @current_items[item] = (value + current_number)
    end
    return "You have added #{item} x #{quantity}"
    
  end  

  def basket_summary
    summary = []
    @menu.each do |food, money|
      @current_items.each do |key, value|
        if key == food 
          total = value * money
          summary.push("#{key}, x#{value}, £#{total.round(2)}")
        end 
      end 
    end 
    summary
  end 
end 