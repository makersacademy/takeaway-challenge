require 'takeaway'

describe Takeaway do
  let(:menu) { double( :menu, dishes: { "Onion Bhaji" => 2.50, "Chicken Tikka Masala" => 7.2, }) }

  subject(:takeaway) { described_class.new(menu: menu, basket: Array.new, bill: 0, dispatched: false) }

  describe 'initialize' do
    it 'has an empty basket' do
      expect(takeaway.basket).to be_empty
    end

    it 'starts with an empty bill' do
      expect(takeaway.bill).to eq 0
    end

    it 'starts with the order incomplete' do
      expect(takeaway.dispatched).to be false
    end

    it 'has a menu array' do
      expect(takeaway.menu).not_to be nil and be_a_kind_of(Hash)
    end
  end

  describe '#basket_summary' do

  end

  describe '#total' do
    it 'prints a total' do
      expect(takeaway.total).to be_a_kind_of(String)
    end
  end

  describe '#checkout' do

  end

  describe '#calculate' do

  end
end
