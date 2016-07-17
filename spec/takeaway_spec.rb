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
      order_hash = { Sandwich: 2 }
      takeaway.order_selection( :Sandwich, 2 )
      expect(takeaway.chosen_items).to eq order_hash
    end
  end

  describe '#order_summary' do

    it 'returns a summary of the order' do
      takeaway.order_selection( :Sandwich, 2)
      takeaway.order_selection( :Lemonade, 2)
      expect(takeaway.order_summary).to eq "Sandwich x 2 = $10.00, Lemonade x 2 = $2.50"
    end
  end

  
end
