require 'takeaway'

describe 'User stories' do
  #   User story 1:
  #   As a customer
  #   So that I can check if I want to order something
  #   I would like to see a list of dishes with prices
  describe '#show_menu' do
    it 'shows a list of dishes with prices' do
      takeaway = Takeaway.new
      expect { takeaway.show_menu }.not_to raise_error
    end
    it 'shows a list of dishes with prices' do
      takeaway = Takeaway.new
      expect(takeaway.show_menu).to eq(Takeaway::MENU)
    end
  end
  # User story 2:
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  describe '#place_order' do
    let(:order) { double :order }
    let(:order_total) { double :order_total }
    it 'selects some number of several available dishes' do
      takeaway = Takeaway.new
      expect { takeaway.place_order(order, order_total) }.not_to raise_error
    end
  end
end
