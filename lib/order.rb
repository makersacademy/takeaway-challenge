class Order

  def initialize(dishes:, bill:)
    @dishes = dishes
    @bill = bill
  end

  def check_bill
    bill = (@dishes.map { |dish, quantity| dish.price * quantity }.reduce(:+)).round(2)
    raise 'Incorrect Bill' if @bill != bill
    confirmation_text
  end

end
