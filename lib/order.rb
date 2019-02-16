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
    puts "#{dish.name} added to order."
    recalculate_total
  end

  def recalculate_total
    @total = 0
    @dishes.each do |dish|
      @total += dish.price
    end
  end

  def placed?
    @complete
  end

  def place
    @complete = true
  end

  def show_items
    @dishes.each do |dish|
      puts dish.name
    end
  end

  def send_sms_confirmation
    sms = SMS.new
    # sms.send
    print(sms)
  end
end
