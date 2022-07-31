require_relative 'menu'
require_relative 'basket'
require_relative 'send_sms'

class Order

  DEFAULT_MENU = Menu.new

  attr_reader :menu, :basket

  def initialize(menu = DEFAULT_MENU, basket = Basket.new)
    @menu = menu
    @basket = basket
  end

  def review_menu(message = @menu.review_menu)
    show_message(message)
  end

  def review_basket(message = @basket.review_contents)
    show_message(message)
  end

  def add_to_basket(item_i, quant = 1)
    fail show_error(:wrong_number) unless @menu.valid_choice?(item_i)
    quant.times { @basket.add_item(@menu.fetch_item(item_i)) }
    review_basket
  end

  def place_order(timestamp = Time.new)
    fail show_error(:empty_basket) if @basket.empty?
    send_confirmation_text(thank_you(timestamp)) if timestamp.class == Time
    thank_you(timestamp)
  end

  private

  def show_message(message)
    puts message
    true
  end

  def thank_you(time)
    "Thank you! Your order will be delivered before #{time.hour + 1}:#{format_min(time.min)}"
  end

  def format_min(min)
    min < 10 ? "0#{min}" : min
  end

  def show_error(message)
    case message
      when :wrong_number then "Input error: number doesn't appear in list"
      when :empty_basket then "Basket is empty"
    end
  end

end
