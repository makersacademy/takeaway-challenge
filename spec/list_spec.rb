require 'list'

describe List do

  let(:list) { List.new }
  let(:items) { double :items , keys: [ :pappadom_preach ], values: [ 4.50 ] }
  let(:menu) { double :menu }

  describe '#add_list' do
    it 'adds an item to the order' do
      list.add_list(1, 1, items)
      expect(list.dishes).to include(:pappadom_preach)
    end

    it 'adds more than one item to an order' do
      expect { list.add_list(1, 2, items) }.to change { list.dishes.length }.by(2)
    end
  end

  describe '#current_total' do
    it 'adds the value of dishes to the cost' do
      list.current_total
      expect(list.cost).to eq(0)
    end
  end

end
