
require_relative 'textsms'

class Menu

  LIST_OF_DISHES = { 'formule1' => 10, 'formule2' => 15, 'formule3' => 20, 'drink' => 5 }

  attr_reader :order, :total, :sms

  def initialize
    @order = {}
    @total = 0
    @dishes = []
    @quants = []
    @sms = Textsms.new
  end


  def print
    LIST_OF_DISHES
  end

  def select(dish, quant)
    fail 'Dish not in the menu, try again!' unless LIST_OF_DISHES.include? dish
    @dishes << dish
    puts "#{dish} was added #{quant} time(s)! Select again if you want to add more"
    @quants << quant
    @order = @dishes.zip @quants
  end

  def checkout(total)
     @total = total
     fail ('The sum is incorrect!') if @total != correct_total
     @total = correct_total
     @sms.send('Thank you! Your order is confirmed, it will arrive in an hour!')
  end

  private

  # attr_reader :order

  def correct_total
    tot = 0
    @order.each { |item, quantity| tot += LIST_OF_DISHES[item]*quantity }
    tot
  end

end
