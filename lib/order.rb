require 'time'
require_relative 'confirmation_text'

class Order
  
  attr_reader :list

  def initialize(menu)
    @menu = menu
    @list = []
    @confirmation_text = ConfirmationText.new
  end
  
  def select(dish, quantity)
    quantity.times { @list << @menu.list[dish] }
  end

  def total
    @list.flatten.select{|i|i.is_a? Float}.sum
  end

  def confirm
    delivery_time = (Time.now + (60*60)).strftime("%k:%M")
    @confirmation_text.send_confirmation_text(delivery_time)
  end

end