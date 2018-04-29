class Bill

  attr_reader :total

  def initialize
    @total = 0
  end

  def calculate_bill(menu, orders)
    @total = 0
    orders.each do |order|
      item = menu.find { |list| list[:dish] == order[:dish] }
      @total += order[:quantity] * item[:price].to_f
    end
  end

end
