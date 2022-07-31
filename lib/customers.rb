class Customers
    attr_accessor :a_customer
    
    def initialize
        @a_customer = {}
    end

    def create_customer(customer_name, mobile_number)
        a_customer[customer_name] = mobile_number
    end

end