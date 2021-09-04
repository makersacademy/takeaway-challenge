class Order

  attr_reader :selected_items, :total_price

  def initialize
    @selected_items = []
    @total_price = 0
  end 

  def add_selected_item(name)
    @selected_items << (name)
    calculate_price
  end 

  def calculate_price
    @total_price = 0
    @selected_items.each do |pizza|
    @total_price += pizza.price
    end 
  end 
end 
