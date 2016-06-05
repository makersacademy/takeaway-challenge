require './lib/customer'

MENU = {"Rice" => 1, "Pasta" => 1, "Bread" => 1,}

p "Hello what is your name"
name = gets.chomp.capitalize
p "Hello #{name}, I have a basic menu would you like to see it?"
response = gets.chomp.downcase
if response == "yes"
  current_order = []
  new_customer = Customer.new(MENU)
  new_customer.see_menu
  loop do
    p "Which dish would you like to order?"
    dish = gets.chomp.capitalize.strip
    if dish == "That's all"
      current_order.each do |array|
        array.each do |dish, number|
          new_customer.choose(dish, number)
        end
      end
      p "That will be £#{new_customer.order.total_price}. Is that ok?"
      response = gets.chomp.downcase
      if response == "yes"
        new_customer.pay(new_customer.order.total_price)
        p "Thank you."
      end
      exit
    end
    p "And how many?"
    number = gets.chomp.to_i
    current_order << {dish => number}
  end
else
  exit
end
