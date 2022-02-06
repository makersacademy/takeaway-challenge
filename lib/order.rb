require_relative './dishes_list.rb'
require_relative './text.rb'

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

  # def send_sms
  #   in_one_hour = Time.now + 3600
  #   time = in_one_hour.strftime("%H:%M")
  #   sms_msg = "Thank you! Your order was placed and will be "
  #   sms_msg += "delivered before #{time}. The cost of your order to be paid on delivery is £#{@total}"
  #   @sms.send_sms(sms_msg)
  # end

  # I do not know how long the order might be so use args and * is the 'splat' operator, which means any number 
  # of arguments can be passed to the method and they will be 'splatted' in to an array.

  def order(*args)
    @dishes_ordered = []
    args.each do |number|
      return_dish = @menulist.return_dish(number)
      @dishes_ordered << return_dish if return_dish
    end
    check_total
    @dishes_ordered
  end

end

def confirm_order(
  _to = ENV['TWILIO_TO_NUMBER'],
  # message_class = Sms,
  time = calculate_time
)
  message = "Thank you! Your order was placed and will be "
  message += "delivered before #{time}. The cost of your order to be paid on delivery is £#{@total}"
  @sms.send(message)
end

def calculate_time
  time = Time.now
  "#{time.hour + 1}:#{time.min}"
end

