require 'list'

describe List do

  let(:list) { List.new(menu) }
  let(:menu) { double :menu, items: { korma_police: 4.50 } }

  describe '#add_list' do
    it 'adds an item to the order' do
      list.add_list(1, 1)
      expect(list.dishes).to include(1)
    end

    it 'adds more than one item to an order' do
      expect { list.add_list(1, 2) }.to change { list.dishes.length }.by(2)
    end
  end

  describe '#current_total' do
    it 'adds the value of dishes to the cost' do
      list.add_list(1, 2)
      list.current_total(2)
      expect(list.cost).to eq(9.00)
    end
  end

end
