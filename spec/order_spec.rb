require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:menu) { double :menu, :food_options => { 'Spring rolls' => 2.50 }}

  describe 'customers can place orders' do
    it 'is expected to repeat customer order' do
      expect(order.order_received('Spring rolls', 1)).to eq "Order received for 1 Spring rolls."
    end

    it 'raises an error if the food order does not exist' do
      expect{subject.order_received('Pizza', 1)}.to raise_error "There is no Pizza available on the menu"
    end
  end

  describe 'the bill is calculated throughout and can be checked' do
    it 'adds cost of items to order bill' do
      order.order_received('Spring rolls', 12)
      expect(order.bill).to eq 30
    end

    it 'can check bill' do
      order.order_received('Spring rolls', 2)
      expect(order.check_total).to eq "The bill is currently £5.00."
    end

    it 'raises an error if bill does not have same value as combined selection price', :focus => true do
      allow(order).to receive(:bill_correct?).and_return false
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
      expect(order.string_summary).to eq " Spring rolls x 1: £2.50 |"
    end

  end

end
