require "customer"

describe Customer do 
  let(:customer) { Customer.new("pasta") }

  it { expect(customer).to respond_to(:order) } 

  describe "#place_order" do 
    it "Returns and array with the customers order" do
      expect(customer.place_order.is_a?(Array)).to be true 
    end
  end

end
