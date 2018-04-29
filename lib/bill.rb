class Bill

  attr_reader :total

  def initialize
    @total = 0
  end

  def calculate_bill(menu, order)
    @total = 0
    order.each do |order|
      item = menu.find{|menu| menu[:dish] == order[:dish]}
      @total += order[:quantity] * item[:price].to_f
    end
  end

end
