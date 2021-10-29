require_relative 'menu'

class Order

  attr_reader :menu

  def initialize
    @menu = Menu.new.import
  end

  def add_to_basket(i)
    fail show_error(:wrong_number) unless valid_number?(i)
    @menu[i.to_i - 1][:quant] += 1
  end

  def review_menu
    show_message(format_menu_array.join("\n"))
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
    (@menu.map { |h| h[:quant] }).sum.zero? 
  end

  def valid_number?(n)
    (1..@menu.length).include?(n.to_i)
  end

  def format_menu_array
    formatted_menu = @menu.map.with_index { |h, i| "#{i + 1}. #{h[:item]}, £#{h[:price]}" }
  end

  def format_review_array
    formatted_menu = @menu.map.with_index do |_h, i|
      if (quantity = @menu[i][:quant]) <= 0
        ""
      else
        "x#{quantity} #{@menu[i][:item]}: £#{(@menu[i][:price].to_f * quantity).round(2)}"
      end
    end
    formatted_menu.reject { |s| s == "" } << order_total
  end

  def order_total
    order_sum = @menu.map { |h| (h[:quant].to_f * h[:price].to_f).round(2) }
    "TOTAL: £#{order_sum.sum}"
  end

end
