require 'order'
require 'pry'

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
      order = described_class.new(selection, menu)
      expect(order.selection).to eq selection
    end
  end

  describe '#view' do

    it  'formatted message contains correct items' do
      selection = [1,1,2,3]
      order = described_class.new(selection, menu)
      message = "catnip 	 5\ncatnip 	 5\nCATnip 	 10\nCATNIP 	 15\n-----------------------\ntotal: 	 35"
      expect(order.view).to eq message
    end

  end

  describe '#total' do
    it 'calculates the correct total' do
      selection = [1,1,2,3]
      order = described_class.new(selection, menu)
      expect(order.total).to eq 35
    end
  end

  #
  # context 'displaying order' do
  #   it 'displaying the total' do
  #     selection = [1,1,2,3]
  #     order = described_class.new(selection)
  #
  #   end
  # end
end
