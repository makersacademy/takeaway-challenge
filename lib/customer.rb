class Customer
  attr_reader :name, :balance

  EMPTY_ACCOUNT = 0

  def initialize(name, balance = EMPTY_ACCOUNT)
    @name = name
    @balance = balance
  end

  def charge(amount)
    @balance -= amount
  end
end
