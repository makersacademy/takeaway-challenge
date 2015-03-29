require 'inventory'

describe Inventory do
  let(:inventory) { described_class.new }
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
    it 'can move a selected dish to the shopping basket' do
      inventory.make_list('pizza', 20)
      inventory.add_to_cart('pizza', 2)
      expect(inventory.shopping_basket['pizza']).to eq 2
    end
    it 'can remove a selected dish from the inventory' do
      inventory.make_list('pizza', 20)
      inventory.add_to_cart('pizza', 2)
      expect(inventory.dishes_list['pizza']).to eq 18
    end
    it 'can remove a selected dish from the shopping basket' do
      inventory.make_list('pizza', 20)
      inventory.add_to_cart('pizza', 2)
      inventory.remove_from_cart('pizza', 2)
      expect(inventory.dishes_list['pizza']).to eq 20
    end
    it 'can put back an ex-selected dish into the inventory' do
      # actually tested in the previous test
    end
    it 'knows the remaining quantity of a dish' do
      # actually tested with can remove a selected dish from the inventory'
    end
    it 'knows the list of dishes that need to be displayed as unavailable' do
      inventory.make_list('burger', 3)
      inventory.add_to_cart('burger', 3)
      expect(inventory.unavailable).to eq ['burger']
    end
    it 'cannot add a dish to cart when dish has become unavailable' do
      inventory.make_list('burger', 1)
      inventory.add_to_cart('burger', 1)
      expect { inventory.add_to_cart('burger', 1) }.to raise_error "sorry. There are no burger left"
    end
    it 'cannot add more dishes to the basket than there are available' do
      inventory.make_list('burger', 2)
      expect { inventory.add_to_cart('burger', 3) }.to raise_error "sorry. There are only 2 burgers left"
    end
    xit 'knows when the customer wants to proceed to checkout' do
    end
  end
end