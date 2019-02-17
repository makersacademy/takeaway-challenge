require './lib/sms'

# tracks an Order
class Order
  attr_reader :dishes, :total

  def initialize
    @dishes = []
    @total = 0
    @complete = false
  end

  def add_dish(dish)
    @dishes << dish
    puts "#{dish[:name]} has been added to your order."
    recalculate_total
  end

  def placed?
    @complete
  end

  def place
    if @total.positive?
      @complete = true
      @total = 0
      @dishes = []
    else
      puts 'You have no items in your order'
    end
  end

  def show_items
    system('clear')
    puts 'Here are the items in your order:'
    @dishes.each do |dish|
      puts "#{dish[:name]} (£#{dish[:price]})"
    end
  end

  def send_sms_confirmation
    sms = SMS.new
    sms.send
    puts sms.message
  end

  private
  def recalculate_total
    @total = 0
    @dishes.each do |dish|
      @total += dish[:price]
    end
    puts "Your order is currently at £#{@total}."
  end
end
