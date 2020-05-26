require 'takeaway'

describe Takeaway do 

  # let(:takeaway_dishes) { { "chips" => 1.50, "cheese burger" => 2.50, "chicken wings" => 3.00 } }

  let(:takeaway_dishes) {{chips: 2.50, burgers: 3.50, wings: 5.00}}


  let(:customer_order) { Order.new }
  let(:maximum_dishes) { takeaway_dishes.length }
  # let(:selected_dish) { {dish: "chips", quantity: 4} }
  let(:selected_dish) { {chips: 2, burgers: 3} }


  
  context '#view_dishes' do
    it { is_expected.to respond_to(:view_dishes) }

    it 'returns list of dishes with prices' do 
      expect(subject.view_dishes).to eq(takeaway_dishes)
    end
  end

  context '#place_order' do
    it { is_expected.to respond_to(:place_order).with_unlimited_arguments }

    it 'returns new order object' do
      expect(subject.place_order(selected_dish)).to be_an_instance_of(Order)
    end
  end
end
