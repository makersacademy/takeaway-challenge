require 'order'

describe Order do

  menu = [{ food: "food1", price: 1 }]
  let(:order) { Order.new(menu) }

  it 'sets @menu on initialize' do
    expect(order.menu).to eq menu
  end

  describe '#list_menu' do
    context 'returns #menu' do
      it { expect(order.list_menu).to eq order.menu }
    end
  end

  describe '#menu' do
    context 'stores menu' do
      it { expect(order.menu).to eq menu }
    end
  end

end
