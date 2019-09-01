require_relative './menu_list.rb'
require_relative './text_message.rb'

class Menu

  def initialize
    @list = MenuList.new
    @text = TextMessage.new
    @matched_dishes = []
    @total = 0
  end

  def load_menu
    @list.load_menu
  end

  def show_menu
    puts @list.display_menu
    @list.display_menu
  end

  def send_text
    in_one_hour = Time.now + 3600
    time = in_one_hour.strftime("%H:%M")
    text_msg = "Thank you! Your order was placed and will be "
    text_msg += "delivered before #{time}.  Please have £#{@total} ready"
    @text.send_text(text_msg)
  end

  def order(*args)
    @matched_dishes = []
    args.each do |num|
      return_dish = @list.return_dish(num)
      @matched_dishes << return_dish if return_dish
    end
    check_total
    @matched_dishes
  end

  def check_total
    @total = @list.calculate_total(@matched_dishes)
    puts "Your order total is £#{@total}"
    @total
  end
end
