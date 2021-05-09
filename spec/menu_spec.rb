require 'menu'

describe Menu do
  it 'has a empty menu by default' do
    expect(subject.items).to eq([])
  end

  it 'displays "Empty Menu" when empty' do
    expect(subject.display).to eq("Empty Menu")
  end

  let(:menu) { Menu.new([
    { name: "item_one", price: 2.50, quantity: 1 }, 
    { name: "item_two", price: 5.00, quantity: 1 }])
  }
    
  it 'displays the items with prices' do
    items_and_prices = "item_one: 2.5, item_two: 5.0"
    expect(menu.display).to eq(items_and_prices)
  end

  it 'changes the quantity on the menu' do
    menu.update('item_one', 1)
    expect(menu.items.first[:quantity]).to eq(0)
  end

  describe '#find_item' do
    context 'when the item is on the menu' do
      it 'returns the item' do
        expect(menu.find_item("item_one")).to eq({ name: "item_one", price: 2.50, quantity: 1 })
      end
    end
    # context 'when the item is not on the menu' do
    #   it 'raises an error' do
    #     expect { menu.find_item("item_three") }.to raise_error("Item not on menu")
    #   end
    # end
  end
end
