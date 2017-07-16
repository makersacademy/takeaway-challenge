class Order

  def initialize
    @basket = []
  end

  def order(item, amount)
    amount.times { @basket << item }
    puts "Added #{amount} #{item} to your order"
  end

  def basket
    @basket
  end

  def checkout(amount)

  end

private

end
