require 'order.rb'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:menu) }

  describe '#print_menu'
    it 'shows the list of items available to order with prices' do
      expect(order.read_menu).to eq({:tacos => 5.00, :burrito => 4.00, :enchiladas => 5.00, :margarita => 6.00})
  end
end
