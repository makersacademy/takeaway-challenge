require 'order'
require 'menu'
describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:menu) }

  let(:menu_items) do
    {
      Lasagne: 12,
      Risotto: 8,
      Carbonara: 10
    }
  end 
  
  context '#see_menu' do
    it 'allows the customer to see the menu items' do
      expect(order.see_menu).to include menu_items
    end 
  end 

  context '#place_order' do
    it 'allows the customer to select dishes off the menu' do
      allow(menu).to receive(:dish?) { true }
      order.place_order("Carbonara", 1)
      expect(order.selection).to eq({ :Carbonara => 1 })
    end
    it 'only allows selection of available menu dishes' do
      allow(menu).to receive(:dish?).with(:Arancini) { false }
      expect { order.place_order(:Arancini, 3) }.to raise_error "Arancini is not on the menu today"
    end 
  end 

  context '#add_to_cart' do
    it 'adds orders into a shopping cart' do
      allow(menu).to receive(:dish?) { true }
      order.place_order("Carbonara", 2)
      expect(order.cart).to eq([{ :Carbonara => 2 }])
    end 
  end 

  # it 'calculates the total of the order' do

  # end 
end 
