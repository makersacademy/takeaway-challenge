require 'takeaway'

describe Takeaway do
    describe '#add_to_basket' do
      it 'adds an item and price to the basket' do
        takeaway = Takeaway.new
        takeaway.add_to_basket('bibimbap', 3)
        expect(takeaway.basket).to eq([:item => 'bibimbap', :quantity => 3, :total_price => 31.5])
      end
    end
  #  describe '#total' do
  #    it 'gives the total sum of the basket' do
  #      takeaway = Takeaway.new
  #      takeaway.add_to_basket('bibimbap', 3)
  #      expect(takeaway.total).to eq('£31.50')
  #    end
  #  end
end
