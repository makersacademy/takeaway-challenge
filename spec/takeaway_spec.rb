require 'takeaway'

describe Takeaway do 

  let(:takeaway_dishes) { { "chips" => 1.50, "cheese burger" => 2.50, "chicken wings" => 3.00 } }
  let(:customer_order) { Order.new }
  
  context '#view_dishes' do
    it { is_expected.to respond_to(:view_dishes) }

    it 'returns list of dishes with prices' do 
      expect(subject.view_dishes).to eq(takeaway_dishes)
    end
  end

  context '#place_order' do
    it { is_expected.to respond_to(:place_order).with_unlimited_arguments }

    it 'returns new order object' do
      expect(subject.place_order).to be_an_instance_of(Order)
    end
  end
end
