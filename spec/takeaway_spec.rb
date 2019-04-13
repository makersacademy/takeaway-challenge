require 'takeaway'

describe Takeaway do
  context 'To check if User wants to order something' do
    it 'shows a list of dishes with prices' do
      expect(subject.menu).to include 'pizza'
    end
  end

  context 'So User can order the meal they want' do
    it 'allows User to create an order list' do
      expect(subject.create_order).to be_a Order
    end
  end
end
