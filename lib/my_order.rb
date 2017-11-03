class MyOrder

  attr_reader :store_order, :total, :customer_phone_number
  attr_writer :store_order
  def initialize
    @store_order = nil
    @total = 0
    @customer_phone_number = '0'
  end

  def sum_up_total
    total_array = []
    store_order.each { |item| total_array << item[:Price] }
    total_array.reduce(:+)
  end

  def import_phone_number(num)
    @customer_phone_number = num
  end

end
