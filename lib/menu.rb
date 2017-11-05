class Menu

attr_reader :info, :food, :current_order, :basket

def initialize
  @info = { Satay: 5, RotiCanai: 9, Kuih: 3, NasiLemak: 10}
  @current_order = { food: nil , quantity: nil }
  @quantity = nil
  @basket = []
  # @bill = ""
end

def read_menu
  puts "Malaysian Express - Authentic Malaysian"
  puts "1. Satay - $5.00"
  puts "2. RotiCanai - $9.00"
  puts "3. Kuih - $3.00"
  puts "4. Nasi Lemak - $10"
  return "Choose Option for your order! (Input a Number)"
end

def order(order_option,quantity)
  @quantity = quantity
  case order_option
   when 1
    @option = "Satay"
    adding_food
  when 2
    @option = "RotiCanai"
    adding_food
  when 3
    @option = "Kuih"
    adding_food
  when 4
    @option = "Nasi Lemak"
    adding_food
  end
end


def check_basket
  basket = @basket
  puts "Total Order:\n\n"
  basket.each do |element,number|
    puts "#{number}x #{element}"
  end
end

def adding_food
  @current_order[:food] = @option
  @current_order[:quantity] = @quantity
  @basket << @current_order.values
end

def option(option)
  @option = option
end

def food_quantity(quantity)
  @quantity = quantity
end

end
