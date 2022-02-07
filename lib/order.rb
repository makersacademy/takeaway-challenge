require_relative './dishes_list.rb'
require_relative './send_sms.rb'

class Order

  def initialize
    @disheslist = DishesList.new
    @sms = Text.new
    @dishes_ordered = []
    @total = 0
  end

  def load_menu
    @disheslist.load_menu
  end

  def show_menu
    @disheslist.display_dishes
  end

  # I do not know how long the order might be so use args and * is the 'splat' operator, 
  # which means any number  of arguments can be passed to the method and they will 
  # be 'splatted' in to an array.

  def order(*args)
    @dishes_ordered = []
    p args
    args.each do |num|
      p num
      return_dish = @disheslist.return_dish(num)
      p return_dish
      @dishes_ordered << return_dish if return_dish
    end
    check_total
    @dishes_ordered
  end

  def check_total
    @total = @disheslist.calculate_total(@dishes_ordered)
    @total
  end

  def send_text
    time_plus_one_hour = Time.now + 3600
    time = time_plus_one_hour.strftime("%H:%M")
    message = "Thank you! Your order was placed and will be delivered before #{time}."
    @sms.send_text(message)
  end

end
