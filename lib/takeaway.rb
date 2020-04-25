class Takeaway

  attr_reader :order, :overall_total, :current_total

  def initialize(dishes = {})
    @dishes = dishes
    @order = []
    @current_total = 0
    @overall_total = 0
  end

  def see_dishes
    @dishes.each { |name, price| puts "#{name.capitalize} - £#{price}" }
  end

  def add_dish(item, quantity)
    @current_total = 0
    quantity.times{@order << item}

    @order.each do |dish|
      @current_total += @dishes[dish]
    end

    puts "Current order total is £#{@current_total}."
  end


  def place_order(pay)
    raise "Incorrect amount of money paid!" unless pay == @current_total

    puts "Thank you! Your order was placed and will be delivered before #{delivery_time}. A text will be sent to your phone shortly to confirm your order."
  end

  private

  def delivery_time
    time = Time.new
    the_hour = time.hour
    the_minute = time.min
    "#{the_hour+1}:#{the_minute}"
  end

end
