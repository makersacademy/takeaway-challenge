require 'order'

describe Order do
  subject(:order) { described_class.new }

  let(:whiskies) do
    {
      some_stuff: 3,
      some_other_stuff: 2
    }
  end

  context 'select' do
    it 'can select multiple items from menu' do
      order.add(:some_stuff, 3)
      order.add(:some_other_stuff, 2)
      expect(order.whiskies).to eq(whiskies)
    end

    it 'only allows available items to be selected' do
      
    end
  end
end
