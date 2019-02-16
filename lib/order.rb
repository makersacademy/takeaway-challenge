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
    recalculate_total
  end

  def placed?
    @complete
  end

  def place
    @complete = true
    send_sms_confirmation
  end

  def show_items
    @dishes.each do |dish|
      puts dish[:name]
    end
  end

  def send_sms_confirmation
    sms = SMS.new
    # sms.send
    # print(sms)
  end

  private
  def recalculate_total
    @total = 0
    @dishes.each do |dish|
      @total += dish[:price]
    end
  end
end
