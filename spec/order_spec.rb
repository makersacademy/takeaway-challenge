require 'order'

describe Order do

  let(:order)         { described_class.new(menu) }
  let(:menu)          { double :menu, new: list }
  let(:list)          { double :list, options: "chicken" }

  describe '#initialize' do
    it 'initializes with a menu' do
      expect(order.menu).to eq list
    end
  end

  describe '#list_options' do
    it 'shows the options' do
      expect(order.list_options).to eq "chicken"
    end
  end

end
