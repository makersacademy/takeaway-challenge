require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:whiskies) do
    {
      some_stuff: 2,
      other_stuff: 1
    }
  end

  context 'select' do
    before do
      allow(order).to receive(:has_item?).with(:some_stuff).and_return(true)
      allow(order).to receive(:has_item?).with(:other_stuff).and_return(true)
    end
      
    it 'can select multiple items from menu' do
      order.add(:some_stuff, 2)
      order.add(:some_other_stuff, 1)
      expect(order.whiskies).to eq(whiskies)
    end

    it 'only allows available items to be selected' do
      allow(menu).to receive(:has_item?).with(:durian).and_return(false)
      expect{ order.add(:durian, 5) }.to raise_error WrongItemError "Sorry, we don't offer Durian!"  
    end
  end
end
