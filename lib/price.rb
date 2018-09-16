class Price

  def self.set_price(num, discount: 0)
    num - (num * discount)
  end
end