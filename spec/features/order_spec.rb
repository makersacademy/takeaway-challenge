require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:menu) { double :menu, :food_options => { 'Spring rolls' => 2.50 }}

  describe 'customers can place orders' do
    it 'is expected to repeat customer order' do
      quantity = 1
      food_order = 'Spring rolls'
      expect(order.order_received(food_order, quantity)).to eq "Order received for #{quantity} #{food_order}."
    end

    it 'raises an error if the food order does not exist' do
      food_order = 'Pizza'
      expect{subject.order_received(food_order, 1)}.to raise_error "There is no #{food_order} available on the menu"
    end
  end

  describe 'the bill is calculated throughout and can be checked' do
    it 'adds cost of items to order bill' do
      item_cost = 2.5
      order.order_received('Spring rolls', 12)
      expect(order.bill).to eq (item_cost * 12)
    end

    it 'can check bill' do
      order.order_received('Spring rolls', 2)
      expect(order.check_bill).to eq "The bill is currently £#{order.bill}."
    end

    xit 'raises an error if bill does not have same value as combined selection price', :focus => true do
      allow(order).to receive(:bill) { 30 }
      expect{order.check_total}.to raise_error "There is an error - your bill is not the same as the item cost."
    end
  end

  describe 'is saved and can be requested by the customer' do

    before :each do
      order.order_received('Spring rolls', 1)
    end

    it 'is saved to an array' do
      expect(order.current_order[0]).to include 'Spring rolls'
    end

    it 'is saved to a string' do
      expect(order.string_summary).to eq "Spring rolls x 1: £2.50"
    end

  end

end
