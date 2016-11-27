require './lib/order'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu) }
  let(:takeaway) { double(:takeaway) }
  let(:item) { double(:item) }

  before do
    allow(menu).to receive(:check_price).and_return 4
  end

  context 'Initialization' do

    it 'creates an empty basket on creation' do
      expect(order.basket).to eq ({})
    end

  end

  context 'Calculate Total' do

    it 'calculates total cost' do
      order.basket = ({"Pizza"=>3})
      expect(order.calculate_total).to eq 12
    end

  end

  context 'Add item to order' do

    it 'can add an item to an order if it does not exist yet' do
      order.add("Pizza", 1)
      expect(order.basket).to eq ({"Pizza"=>1})
    end

    it 'can increase quantity for an item that is already in basket' do
      order.add(item, 1)
      order.add(item, 3)
      expect(order.basket[item]).to eq 4
    end

  end


end
