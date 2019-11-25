class Customer
  attr_reader :name, :number, :balance

  EMPTY_ACCOUNT = 0

  def initialize(name, number = nil, balance = EMPTY_ACCOUNT)
    @name = name
    @number = number
    @balance = balance
  end

  def charge(amount)
    @balance -= amount
  end
end
