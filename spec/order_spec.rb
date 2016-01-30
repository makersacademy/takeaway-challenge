require 'order'

describe Order do

  subject(:order) { described_class.new }

  starters = {:soup => 1.50,
  :salad => 1.00,
  :scallops => 2.50}
  mains = {:steak => 7.50,
  :lasagne => 5.50,
  :lobster => 8.00 }
  desserts = {:tiramisu => 2.50,
  :cheesecake => 2.00,
  :profiteroles => 1.50}
  sides = {:bread => 0.50,
  :chips => 1.50,
  :kimchi => 2.00}

  it 'has an order class' do
    expect(order).to be_a Order
  end

  context 'using Menu module' do

    it 'can display starts in a hash' do
      expect(order.view_starters).to eq starters
    end

    it 'can display mains in a hash' do
      expect(order.view_mains).to eq mains
    end

    it 'can display desserts in a hash' do
      expect(order.view_desserts).to eq desserts
    end

    it 'can display sides in a hash' do
      expect(order.view_sides).to eq sides
    end

    it 'can display a full menu in an array' do
      expect(order.view_menu).to eq [starters, mains, desserts, sides]
    end

  end

end
