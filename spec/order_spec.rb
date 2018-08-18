# require 'order'

describe Order do

  let(:order) { double(:order, show_menu: {curry: 5, pizza: 4}) }

  describe '#show_menu' do
    it 'returns a menu with prices' do
      expect(order.show_menu).to eq({curry: 5, pizza: 4})
    end
  end

end