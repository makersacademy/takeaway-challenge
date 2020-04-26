class CustomerSelection
    
  attr_reader :selection, :dish, :quantity, :continue, :menu, :total
    
  def initialize(menu = Menu.new)
    @selection = {}
    @menu = menu
    @total = 0
  end  
    
  def add(item, quantity)
    raise "Item doesn't exist" if !@menu.listOfDishes.include?(item)
    @selection[item] = quantity
  end
  
  def calculate_total
    @total = 0
    @selection.each do |key, value|
      @total += @menu.listOfDishes[key] * value
    end
    @total
  end
  
  def print_order
    @selection.each do |key, value|
      puts "#{key}: #{value}x £#{@menu.listOfDishes[key] * value}"
      end
    puts "Total: £#{calculate_total}"
    @selection
  end
  
end