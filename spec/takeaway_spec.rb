require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  let(:menu_class) { double :menu_class }

  describe '#initialize' do

    it 'checks for an initialized empty hash' do
      expect(takeaway.chosen_items).to be_empty
    end
  end

  describe '#order_selection' do

    it 'raises an error if an item is not on the menu' do
      expect{ takeaway.order_selection(:chicken, 2)}.to raise_error 'item not on menu'
    end

    it 'adds ordered items to the chosen items hash' do
      order_hash = { sandwich: 2 }
      takeaway.order_selection( :sandwich, 2 )
      expect(takeaway.chosen_items).to eq order_hash
    end
  end
end
