class Menu

  attr_reader :dishes, :order

  def initialize
    @dishes = { pizza: 6.00,
      pasta: 6.50,
      chips: 3.00,
      halloumi_fries: 5.50,
      calamari: 7.00,
      bruschetta: 3.50 }
    @order = []
  end

  def print_menu
    @dishes
  end

  def select(item)
    @order << item
  end

  def receipt
    total = 0
    copy = ""
    @order.each do |dish|
      copy += "#{dish} #{@dishes[dish.to_sym]} \n"
      total += @dishes[dish.to_sym]
    end
    copy + "Total #{total}"
  end
end
