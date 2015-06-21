class Takeaway

  attr_reader :preparing

  def initialize menu
    @menu = menu
    @preparing = []
  end

  def order dishes, quantities, total
    might_prepare = dishes.zip(quantities)
    raise "Not totalling to expected" unless (bill_comes_to might_prepare) == total
    @preparing = might_prepare
  end

  def bill_comes_to order
    bill = order.map { |dish,quantity| quantity * @menu.content[dish]}
    total = bill.inject { |sum,n| sum + n }
    total
  end

end
