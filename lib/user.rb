class User
  attr_accessor :name, :email, :address, :phone
  def initialize(name, email, address, phone)
    @name = name
    @email = email
    @address = address
    @phone = phone
    @orders = []
  end
end