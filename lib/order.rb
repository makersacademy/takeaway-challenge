require_relative 'menu'
require_relative 'language'

#Order collectes the customers order and details

class Order


  attr_reader :items, :payment, :mobile_number

  def initialize
    @items = Hash.new
    @payment
    @mobile_number
  end

  def input
    Language.request_dish
    item = gets.chomp
    Language.request_quantity
    quantity = gets.chomp
    items[item] = quantity.to_i
    while true
      Language.request_dish
      item = gets.chomp
      break if item == ""
      Language.request_quantity
      quantity = gets.chomp
      items[item] = quantity.to_i
    end
  end

  def total(menu)
    Language.confirm(items, menu)
    self.payment = gets.chomp.to_i
  end

  def get_number
    Language.number
    self.mobile_number = gets.chomp
  end


  private

  attr_writer :payment, :mobile_number

end
