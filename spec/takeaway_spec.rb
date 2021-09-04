require 'takeaway'

describe Takeaway_menu do 
  context 'I want to order something' do
    it 'shows a list of items avalible with prices' do
      expect(subject.menu).to include 'pizza'
    end
  end

  context 'allows an order to be created' do 
    it 'creates a order list' do
      expect(subject.create_order).to be_a Order
    end 
  end 
end 