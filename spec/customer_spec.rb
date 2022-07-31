require 'customers'

describe Customers do

    let(:my_customer) { Customers.new }

    describe "#create_customer" do
        it "Should add a new customer with a name and number" do
            mobile_number = 7999985111
            expect(my_customer.create_customer("Joe Bloggs", mobile_number)).to eq mobile_number
        end
    end

end