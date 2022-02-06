require_relative './dishes_list.rb'
require_relative './send_sms.rb'

class Order

  def initialize
    @menulist = DishesList.new
    @sms = Text.new
    @dishes_ordered = []
    @total = 0
  end

  def load_menu
    @menulist.load_menu
  end

  def show_menu
    @menulist.display_dishes
  end

  def check_total
    @total = @menulist.calculate_total(@dishes_ordered)
    @total
  end

  # I do not know how long the order might be so use args and * is the 'splat' operator, 
  # which means any number  of arguments can be passed to the method and they will 
  # be 'splatted' in to an array.

  def order(*args)
    @dishes_ordered = []
    args.each do |number|
      return_dish = @menulist.return_dish(number)
      @dishes_ordered << return_dish if return_dish
    end
    check_total
    @dishes_ordered
  end

  def send_text
    time_plus_one_hour = Time.now + 3600
    time = time_plus_one_hour.strftime("%H:%M")
    message = "Thank you! Your order was placed and will be delivered before #{time}."
    @sms.send_text(message)
  end
  
end
