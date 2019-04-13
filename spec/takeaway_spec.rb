require 'takeaway'

describe Takeaway do
  context 'To check if User wants to order something' do
    it 'shows a list of dishes with prices' do
      expect(subject.menu).to be_an Array
    end
  end

  context 'So User can order the meal they want' do
    it 'allows User to create an order list' do
      order = Order.new
      expect(subject.create_order(order)).to eq order
    end
  end
end
