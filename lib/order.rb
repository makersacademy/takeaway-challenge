require_relative 'send_sms'

class Order

  DEFAULT_TOTAL = 0

  attr_reader :basket, :total, :final_bill

  def initialize(basket, send_sms = SendSms.new)
    @basket = basket
    @total = DEFAULT_TOTAL
    @final_bill = []
    @send_sms = send_sms
  end

  def show_order
    get_quantities
    get_dish_breakdowns
    show_final_bill
  end

  def confirm!
    @send_sms.send_text_message(@total)
  end

  private

  def get_quantities
    @quantities = Hash.new(0)
    @basket.each { |item, price|  @quantities[item] += 1 }
  end

  def get_dish_breakdowns
    @quantities.each do |item, quantity|
    dish_sum = quantity * Menu::DISH_LIST[item]
      @final_bill << [item, quantity, dish_sum]
    end
  end

  def get_total
    @basket.map { |item, price| price }.sum
  end

  def show_final_bill
    @total = get_total
    @final_bill.each do |item, quantity, price|
      puts "#{item} quantity: #{quantity} price: #{price}"
    end
    puts "total: #{total}"
  end

end
