require 'inventory'

describe Inventory do
  let(:inventory) { Inventory.new }
  context 'when created' do
    it 'has a dishes list when created' do
      inventory.make_list('pizza', 20)
      expect(inventory.dishes_list).to include "pizza"
    end
    it 'knows the default quantity of each dish' do
      inventory.make_list('pizza', 20)
      expect(inventory.dishes_list['pizza']).to eq 20
    end
    it 'informs on dishes not being available anymore' do
      expect { inventory.make_list('unicorn steak', 0) } .to raise_error
      "unicorn steak is not available anymore"
    end
    it 'has an empty shopping basket when created' do
      # I tried to eq {} at first and it didn't work!
      # IRB confirms that when created it's {}. Any better way to do?
      expect(inventory.shopping_basket).to be_a Hash
    end
  end

  context 'when a client order is being processed' do
    xit 'can move a selected dish to the shopping basket' do
    end
    xit 'can remove a selected dish from the inventory' do
    end
    xit 'can remove a selected dish from the shopping basket' do
    end
    xit 'can put back an ex-selected dish into the inventory' do
    end
    xit 'knows the remaining quantity of a dish' do
    end
    xit 'knows when a specific dish becomes unavailable' do
    end
    xit 'knows when the customer wants to proceed to checkout' do
    end
  end
end