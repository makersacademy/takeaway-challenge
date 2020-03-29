require 'order'

describe Order do
    let(:customer) { Order.new }

    it "has the fuction for a user to make a new order" do
        expect(subject).to respond_to :make_order
    end

    it "allows the user to generate a new oder" do
        expect(customer.make_order("Chicken Curry", "Rice")).to eq ["Chicken Curry", "Rice"]
    end
end