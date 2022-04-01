require 'byebug'
require 'order_confirmation'

class Takeaway

  attr_reader :menu, :args

  MENU = {
    "Samosas" => 5,
    "Chilli Chicken" => 7,
    "Pau Bhaji" => 5,
    "Chicken Ruby"  => 12, 
    "Mattar Paneer" => 11, 
    "Chole" => 9,
    "Black Daal" => 7
  }

  def initialize 
    @clients_order = []
  end

  def view_menu
    MENU
  end

  def select_dishes(*args)
    @args = args
    @clients_order.push(@args).flatten
  end

  def check_total
    order_total = @clients_order.flatten.map{ |value| MENU.fetch(value)}
    order_total.sum
  end
  
  def order_confirmation
    order_confirmation = Order_confirmation.new
    order_confirmation.text_message
  end
end