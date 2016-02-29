require 'takeaway'

describe Takeaway do 
	subject(:takeaway) {described_class.new}

  context '#menu' do
  	it "has a class Takeaway" do
  		expect(takeaway).to be_an_instance_of Takeaway
  	end

  	it "has a menu (list) of dishes" do
      expect(takeaway.menu).to include("Burger")
    end

    it "has prices for each dish" do
      expect(takeaway.menu["Burger"]).to eq(10)
    end
  end

  context '#order' do
    it "can order a dish" do
      takeaway.order(:order, 1)
      expect(takeaway.confirm_order).to include(:order)
    end

    it "can order multiples of dishes" do
      takeaway.order(:order, 3)
      expect(takeaway.confirm_order).to include(:order, :order, :order)
    end
  end

  context '#receipt' do
    it 'has a receipt for my order' do
      takeaway.order("Burger", 1)
     # takeaway.confirmed_order(10)
      #expect(takeaway.total).to eq(true)
    end

    it 'confirms my order with a text message' do
      takeaway.order("Burger", 1)
      #takeaway.confirmed_order(10)
      #expect(takeaway.confirmed_order(10)).to receive(:send_text).with("Thank you for your order! Your total is #{takeaway.order_total}")
    end  
  end

end