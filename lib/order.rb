require_relative './menu'
require_relative './dish_printer'
require 'envyable'
Envyable.load('config/env.yml')

class Order

  attr_reader :order_dishes, :completed, :menu, :paid

  def initialize(menu=Menu.new,
    printer=DishPrinter.new,
    texter = Texter.new,
    text_number = ENV['MY_NUMBER'])
    @menu = menu
    @order_dishes = []
    @printer = printer
    @texter = texter
    @text_number = text_number
    @completed = false
  end

  def show_menu(puts_out=true)
    @menu.print(puts_out)
  end

  def add_dish(i, n)
    raise Exception.new(
      'Items cannot be added after order is completed!'
      ) if @completed
    @order_dishes << @menu.select(i,n)
    @order_dishes.flatten!
  end

  def show_order(puts_out=true)
    if puts_out
      puts @printer.print(@order_dishes)
    else
      @printer.print(@order_dishes)
    end
  end

  def total
    @order_dishes.reduce(0.0) do |sum, dish|
      sum + dish.price
    end
  end

  def pay(amount)
    raise Exception.new(
      'That is not the correct amount!'
      ) if amount != total
    @completed = true
    send_text
  end

  def change_menu(menu)
    @menu = menu
  end

  private

  def format_time
    deliverytime = Time.now + 3600
    deliverytime.strftime("%H:%M")
  end

  def text_body
    "Thank you! Your order was placed and will "\
    "be delivered before #{format_time}"
  end

  def send_text
    @texter.send(@text_number, text_body)
  end

end
