require 'menu'

describe Menu do

let(:items) do
    { :margherita => 6.5 }
  end
let(:menu) { described_class.new(items) }

  describe '#items' do
    it 'should contain a list of the menu items' do
      expect(menu.items).to eq(items)
    end
  end

  describe '#print_list' do
    it 'should print a list of dishes and prices' do
      printed_menu = "Margherita: £6.50"
      expect(menu.print_list).to eq(printed_menu)
    end
  end
end
