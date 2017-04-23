
require_relative 'textsms'

class Menu

  LIST_OF_DISHES = { 'formule1' => 10, 'formule2' => 15, 'formule3' => 20, 'drink' => 5 }

  attr_reader :order, :total, :sms

  def initialize
    @order = {}
    @total = 0
    @dishes=[]
    @quants =[]
    @sms = Textsms.new
  end


  def print
    LIST_OF_DISHES
  end

  def select(dish, quant, total)
    @dishes << dish
    puts "#{dish} was added! Select again if you want to add more"
    @quants << quant
    @order = @dishes.zip @quants
    @total = @total+total
  end

  def checkout
     fail ('The sum is incorrect!') if @total != correct_total
     @total = correct_total
     @sms.send('Thank you! Your order is confirmed, it will arrive in an hour!')
  end

  private

  attr_reader :order

  def correct_total
    tot = 0
    @order.each { |item, quantity| tot += LIST_OF_DISHES[item]*quantity }
    tot
  end

end
