require 'order'
require 'menu'

describe Order do
  subject(:order) {described_class.new(menu)}
  let(:basket) {double :basket}
  let(:menu) {instance_double('Menu')}

  it 'starts with an empty basket' do
      expect(order.basket).to be_empty
  end

  it 'raises error if dish not avaiable' do
    allow(menu).to receive(:has_dish?).with(Pizza).and_return(true)
    order.place_order('pizza', 1)
    expect(order.place_order).to eq 'Pizza' => 1
  end
  end