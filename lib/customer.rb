class Customer
  MY_PHONE_NUMBER = ENV['MY_NUMBER']
  attr_reader :phone_number
  def initialize(phone_number)
    @phone_number = phone_number
  end

end
