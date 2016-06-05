require 'take_away'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, all: {:chicken => 3.50, :chips => 2.20, :burger => 4.00 }) }

  describe '#menu' do
    it 'gives a data object to the user' do
      expect(takeaway.menu).to respond_to(:each)
    end
  end
  
  describe '#order' do
    it 'adds an item to the order' do
      takeaway.order(:chicken)
      expect(takeaway.basket.last).to eq({:chicken => 3.50})
    end

    it 'throws an error if item does not exist' do
      expect{ takeaway.order(:squirrel) }.to raise_error("No such item")
    end 
    it 'adds multiple items to the order' do
      takeaway.order(:chicken, 3)
      expect(takeaway.basket).to eq([{:chicken => 3.50}, {:chicken => 3.50}, {:chicken => 3.50}])
    end
  end
  
  describe '#subtotal' do
    it 'gives the total order value' do
      takeaway.order(:chicken,3)
      expect(takeaway.subtotal).to eq "10.50"
    end
  end

  describe '#total' do
    it 'returns the total order and the value' do
      takeaway.order(:chicken,3)
      expect(takeaway.total).to eq "Total cost: £10.50, contains: {:chicken=>3.5}, {:chicken=>3.5}, {:chicken=>3.5}"
    end
  end
end
