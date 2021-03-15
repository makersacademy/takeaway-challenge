class Customer
  def initialize(number = '08008888888')
    @number = number
    @address = { address: '72 Reunification Avenue, New Tokyo, UNC', post_code: '12NE XS9' }
    @payment = { type: 'credit_card', number: 0001_1100_1010_1000, expiry_date: '12/77', ccc: 888 }
  end

  attr_reader :number, :address, :payment
end
