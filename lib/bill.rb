class Bill

attr_reader :total, :order

  def initialize(menu, order)
    @menu = menu
    @order = order
    @total = 0
  end

  def calculate_bill
    @order.each do |order|
      item = @menu.find{|menu| menu[:dish] == order[:dish]}
      @total += (order[:quantity] * item[:price].to_f)
    end
  end

end
