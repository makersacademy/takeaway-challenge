require 'inventory'

describe Inventory do
  let(:inventory) { Inventory.new }
  context 'when created' do
    it 'has a dishes list when created' do
      inventory.make_list('pizza', 20)
      expect(inventory.dishes_list).to include "pizza"
    end
    xit 'knows the default quantity of each dish' do
    end
    xit 'informs on dishes not being available anymore' do
    end
    xit 'has a shopping basket' do
    end
    xit 'has an empty shopping basket when created' do
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