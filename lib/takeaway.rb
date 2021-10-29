require_relative 'menu'

class Order

  DEFAULT_MENU = Menu.new.import

  attr_reader :menu, :basket

  def initialize(menu = DEFAULT_MENU)
    @menu = menu
    @basket = []
  end

  def review_menu
    show_message(format_menu_array.join("\n"))
  end

  def add_to_basket(item_i, quant = 1)
    fail show_error(:wrong_number) unless valid_number?(item_i)
    quant.times { @basket << @menu[item_i.to_i - 1] }
  end

  def review_order
    show_message(format_review_array.join("\n"))
  end

  def place_order(timestamp = Time.new)
    fail show_error(:empty_basket) if empty_basket?
    send_text if timestamp.class == Time
    show_message(thank_you(timestamp))
  end

  def send_text
  end

  private

  def show_message(message)
    formatted_menu = message
    puts formatted_menu
    formatted_menu
  end

  def thank_you(time)
    "Thank you! Your order was placed and will be delivered before #{time.hour + 1}:#{time.min}"
  end

  def show_error(message)
    case message
      when :wrong_number then "Input error: number doesn't appear in list"
      when :empty_basket then "Basket is empty"
    end
  end

  def empty_basket?
    @basket.count.zero? 
  end

  def valid_number?(n)
    (1..@menu.length).include?(n.to_i)
  end

  def format_menu_array
    formatted_menu = @menu.map.with_index { |h, i| "#{i + 1}. #{h.name}, £#{h.price}" }
  end

  def format_review_array
    @basket.map { |h| count_and_format_basket(h) }.uniq << order_total
  end

  def count_and_format_basket(item)
    item_count = @basket.count(item)
    "x#{item_count} #{item.name}: £#{item_count.to_f * item.price}"
  end

  def order_total
    order_prices = @basket.map { |h| h.price }
    "TOTAL: £#{order_prices.sum}"
  end

end
