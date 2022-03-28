
require 'colorize'

class Order
 
  ITALIAN = {
    "Focaccia" => 4, 'Burrata' => 8, 'Salad' => 5, 'Brusscetta' => 5,
    'Salami' => 6, 'Lasagne' => 5, 'Pizza Margherita' => 10,'Arrabiata' => 10,
    'Penne a la Vodka' => 12, 'Canelloni' => 15, 'Pumpkin Ravioli' => 12,
    'Eggplant Parmigiana' => 13, 'Spaghetti Puttanesca' => 10,
    'Penne Pomodoro' => 9, 'Tiramisu' => 6, 'Afogato' => 7
  }.freeze

  attr_reader :my_order

  def initialize
    @my_order = []
  end

  def view_menu
    ITALIAN.each do |key, value|
      puts "#{key},  £#{value}".colorize(:yellow).center(100)
    end
  end

  def add_dish(dish, quantity)
    quantity.times do
      @my_order << ITALIAN.select { |k,_v| k == dish }
    end
  end 

  def view_my_order
    print_out_my_order
    puts "You're total is £#{total}".colorize(:light_yellow)
  end

  def send_sms_confirmation
    require_relative "./send_delivery_sms"
  end

  def total
    total = @my_order.map { |hash| hash.values }.flatten.sum
  end

  private

  def order_is_empty?
    @my_order.empty?
  end

  def print_out_my_order
    @my_order.each do |hash| 
      hash.each { |dish, price| puts "#{dish},  £#{price}".colorize(:light_yellow) }
    end
  end
end
