class Customer
  attr_reader :name, :address, :phone
  attr_reader :list_of_customer

    def initialize(name, address, phone)
      @name = name
      @address = address
      @phone = phone
      list_of_customer = Hash.new(0)
    end

private

end   # => class customer
