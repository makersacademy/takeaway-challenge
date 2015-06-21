class Takeaway

  attr_reader :preparing

  def initialize menu
    @menu = menu
    @preparing = []
  end

  def order dishes, quantities, total
    @preparing = dishes.zip(quantities)

  end

  def bill_comes_to
    bill = preparing.map { |dish,quantity| quantity * @menu.content[dish]}
    total = bill.inject { |sum,n| sum + n }
    total
  end

end
