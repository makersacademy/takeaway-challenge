require 'takeaway'

RSpec.describe Takeaway do
  subject(:thai) { Takeaway.new }
  describe '#Read menu functionality' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it { is_expected.to respond_to(:show_menu) }

    it 'When passed menu object, show menu' do
      expect(thai.show_menu).to eq(Menu::MENU)
    end
  end

  describe '#Order dishes functionality' do
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes

    it { is_expected.to respond_to(:order).with(2).arguments }

    it 'Stores more than 1 quantity in array' do
      expect(thai.order('Chicken Pad Thai', 5)).to eq [['Chicken Pad Thai', 5]]
    end
  end

end
