require 'order'
require 'menu'
describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:menu) }

  it 'allows the customer to select dishes off the menu' do
    allow(menu).to receive(:has_dish?) { true }
    order.place_order("Carbonara", 1)
    expect(order.selection).to eq({ :Carbonara => 1 })
  end

  it 'adds orders into a shopping cart' do
    allow(menu).to receive(:has_dish?) { true }
    order.place_order("Carbonara", 2)
    expect(order.cart).to eq([{ :Carbonara => 2 }])
  end 

  it 'only allows selection of available menu dishes' do
    allow(menu).to receive(:has_dish?).with(:Arancini) { false }
    expect { order.place_order(:Arancini, 3) }.to raise_error "Arancini is not on the menu today"
  end 
end 
