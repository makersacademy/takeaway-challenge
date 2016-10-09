require 'menu.rb'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#print_menu' do
    it 'shows the list of items available to order with prices' do
      expect(menu.print_menu).to eq({:tacos => 5.00, :burrito => 4.00, :enchiladas => 5.00, :margarita => 6.00})
    end
  end

end
