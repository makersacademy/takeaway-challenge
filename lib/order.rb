class Order

attr_accessor :customer_order, :menu, :total_value

  def initialize
    @customer_order = []
    @total_value = 0
    @menu = Menu.new
    get_order
  end

  def get_order
    puts 'What would you like to order?'
    puts "To finish, just press enter twice!"
    @dish = gets.chomp
    until @dish.empty? do
      puts "How many #{@dish}'s would you like?"
      qty = gets.chomp.to_i
      @total = @menu.full_menu[@dish] * qty
      @customer_order << {:dish => @dish, :qty => qty, :total => @total}
      puts "Next dish?"
      @dish = gets.chomp
    end
    order_value
    prints
  end

  def order_value
    @customer_order.each do |dish|
      @total_value += dish[:total]
    end
  end

  def prints
    puts "============Customer Confirmation============".center(500)
    @customer_order.each{|dish| puts "#{dish[:dish]} x #{dish[:qty]}....£#{'%.2f' % dish[:total]}".center(500)}
    puts "---------------------------------------------".center(500)
    puts "Order Total: £#{'%.2f' % @total_value}".center(500)
    send_confirmation
  end

  def send_confirmation
    require_relative 'send_sms'
  end

end
