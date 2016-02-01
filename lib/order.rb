require_relative 'menu'
require_relative 'messager'

class Order

  attr_reader :list, :menu, :total_cost, :order, :message, :messager

  def initialize(menu = Menu.new, messager = Messager.new)
    @list = []
    @menu = menu
    @pizzas = menu.pizzas
    @messager = messager
  end

  def read_menu
    @menu.display_menu
  end

  def choose(item, n = 1)
   n.times do @choice = @pizzas.select { |key, value| item.include? key }
     fail "Not on menu! Make another choice." if @choice.empty?
     @list << @choice
   end
   "You have added #{n} x #{item} to your order."
  end

  def total
    @list = @list.map{ |item| item.values }.flatten
    @total_cost = @list.inject{ |sum,x| sum + x }
    "The total cost is £#{@total_cost}."
  end

  def place
    @message = "Thank you for your order! " \
    "It will be delivered before #{time_in_hours}."
  end

  def send_message
    @messager.send_sms(@message)
  end

  private

  def time_in_hours
    t = Time.now + 60*60
    t.strftime("%H:%M")
  end

end
