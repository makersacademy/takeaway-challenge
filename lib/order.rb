require_relative './menu'
require_relative './dish_printer'

class Order

  attr_reader :order_dishes, :completed, :menu, :paid

  def initialize(menu=Menu.new,
    printer=DishPrinter.new,
    texter = Texter.new,
    text_number = '+447951596154')
    @menu = menu
    @order_dishes = []
    @printer = printer
    @completed = false
    @texter = texter
    @text_number = text_number
    @paid = false
  end

  def add_dish(i, n)
    raise Exception.new('Items cannot be added after order is completed!') if @completed
    @order_dishes << @menu.select(i,n)
    @order_dishes.flatten!
  end

  def show_menu(puts_out=true)
    @menu.print(puts_out)
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

  def complete
    raise Exception.new("You cannot complete the order "\
      "until you have paid!") unless paid
    @completed = true
    send_text
  end

  def change_menu(menu)
    @menu = menu
  end

  def text_body
    "Thank you! Your order was placed and will "\
    "be delivered before #{format_time}"
  end

  def pay(amount)
    raise Exception.new('That is not the correct amount!') if amount != total
    @paid = true
  end

  private

  def send_text
    @texter.send(@text_number, text_body)
  end

  def format_time
    deliverytime = Time.now + 3600
    deliverytime.strftime("%H:%M")
  end

end
