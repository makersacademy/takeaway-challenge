require_relative 'send_text'

class Menu
  
  attr_reader :menu
  attr_reader :select
  attr_reader :order
  attr_reader :send
  

  def initialize
    @menu = {'1.Margherita' => '7.00', "2.Hawaiian" => '8.00', "3.Farmhouse" => '8.00', "4.Pepperoni Feast" => '8.50', "5.Beef Sizzler" => '9.00', "6.Vegtable" => '7.00', "7.Supreme" => '9.00', "8.Meat Feast" => '10.00'}
    @select = { 1 => '1.Margherita', 2 => "2.Hawaiian", 3 => "3.Farmhouse", 4 => "4.Pepperoni Feast", 5 => "5.Beef Sizzler", 6 => "6.Vegtable", 7 => "7.Supreme", 8 => "8.Meat Feast" }
    @order = []
  end

  def see
     menu.each {|key, value| puts "#{key} is £#{value}"}
  end

  def select_pizza number
    order << select[number]
  end

  def total
    total = 0
    order.collect{ |pizza| total += menu[pizza].to_f}
    total
  end 

  def complete_order
    message = "Your pizza(s) will be delivered before #{Time.new+3600}"
    send=Send_Text.new(message: message, from: pizza, to:customer)
    send.text
    total 
  end


end 

