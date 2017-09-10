require 'order'

RSpec.describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double 'menu' }
  before do
    items = [['catnip',5],['CATnip',10],['CATNIP',15]]
    allow(menu).to receive(:items).and_return(items)
  end

  context 'order selection' do
    it 'stores an initial selection' do
      selection = [1,1,2,3]
      order = described_class.new(selection)
      expect(order.selection).to eq selection
    end
  end

  describe '#view' do
    it 'displays same number of items as in selection' do
        selection = [1,1,2,3]
        order = described_class.new(selection)
    end
  end

  context 'displaying order' do
    it 'displaying the total' do
      selection = [1,1,2,3]
      order = described_class.new(selection)

    end
  end
end
