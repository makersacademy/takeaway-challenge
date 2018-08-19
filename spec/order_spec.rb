require 'order'

describe Order do

  menu = [{ food: "food1", price: 1 }]
  menu_two = [{ food: "food1", price: 1 },
              { food: "food1", price: 1 },
              { food: "food2", price: 2 }]
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

  describe '#select_items' do
    it 'places hashes into @selected array' do
      order.add_items(1, 2)
      expect(order.selected).to eq [{ :food => "food1", :price => 1 },
                                    { :food => "food1", :price => 1 }]
    end

    it 'raises_error if item_number is not recognised' do
      expect { order.add_items(2) }.to raise_error 'Item number not recognised'
      expect { order.add_items(-2) }.to raise_error 'Item number not recognised'
    end

  end

  describe '#list_order' do
    it 'creates new array with #selected duplicate count added' do
      order.instance_variable_set(:@selected, menu_two)
      expect(order.list_order).to eq [[{ :food => "food1", :price => 1 }, 2], [{ :food => "food2", :price => 2 }, 1]]
    end
  end

  describe '#total_cost' do
    it 'returns total added values of :price in #selected' do
      order.instance_variable_set(:@selected, menu_two)
      expect(order.total_cost).to eq 4
    end
  end

  describe '#complete_order' do

    before do
      allow(order).to receive(:send_to_messenger)
    end

    it 'returns order completed' do
      expect(order.complete_order).to eq 'Order Completed'
    end

    describe '#reset_order' do
      it 'resets @selected @total' do
        order.instance_variable_set(:@selected, menu_two)
        order.instance_variable_set(:@total, 10)
        order.send(:reset_order)
        expect(order.instance_variable_get(:@selected)).to eq []
        expect(order.instance_variable_get(:@total)).to eq 0
      end
    end

    describe '#send_to_messenger' do
      it 'responds to .Order' do
        expect(order).respond_to?(:send_to_messenger)
      end
    end
  end
end
