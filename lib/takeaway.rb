require_relative "menu"
require_relative "sms"

class Takeaway

  def initialize(menu:,sms:SMS.new)
    @menu_class = menu
    @sms = sms
    @selected_dishes = {}
  end

  def list_dishes
    @menu_class.dishes
  end

  def order
    while true
      numbered_list_dishes
      input = user_input
      break if input == 99
      dish = @menu_class.dishes.keys[input - 1]
      @selected_dishes[dish].nil? ? @selected_dishes[dish] = 1 : @selected_dishes[dish] += 1
    end
  end

  def check_order
    array = []
    @selected_dishes.each do |key,value|
      array << "#{key} x#{value} - £#{@menu_class.dishes[key] * value}"
    end
    array << "Total - £#{order_total}"
    array.join("\n")
  end

  def confirm_order
    @sms.confirmation_text(confirmation_message)
  end

  private

  def numbered_list_dishes
    counter = 0
    @menu_class.dishes.each do |key,value|
      puts "#{counter + 1}. #{key} - £#{value}"
      counter += 1
    end
    puts "99. Exit"
  end

  def user_input
    puts "Select from above"
    input = gets.to_i
  end

  def order_total
    total = 0
    @selected_dishes.each do |key,value|
      total += @menu_class.dishes[key] * value
    end
    total
  end

  def confirmation_message
    time = Time.new + 3600
    "Thank you! Your order was placed and will be delivered before #{time.strftime("%H:%M")}"
  end
end
