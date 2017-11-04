class Menu

attr_reader :info, :food

def initialize
  @info = { Satay: 5, RotiCanai: 9, Kuih: 3, NasiLemak: 10}
  @current_order = { food: nil }
end

def read_menu
  puts "Malaysian Express - Authentic Malaysian"
  puts "1. Satay - $5.00"
  puts "2. RotiCanai - $9.00"
  puts "3. Kuih - $3.00"
  puts "4. Nasi Lemak - $10"
  return "Choose Option for your order! (Input a Number)"
end

def order(order_option)
  case order_option
   when 1
    @option = "Satay"
    @current_order[:food] = @option
  when 2
    @option = "RotiCanai"
    @current_order[:food] = @option
  when 3
    @option = "Kuih"
    @current_order[:food] = @option
  when 4
    @option = "Nasi Lemak"
    @current_order[:food] = @option
  end
end

def option(option)
  @option = option
end



end
