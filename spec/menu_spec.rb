require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  let(:dishes) do
    { "Prawn Crackers" => 1.51,
    "Prawn Gyoza" => 3.51,
    "Chicken Gyoza" => 3.11,
    "Spring Rolls" => 3.15
    }
  end

  context 'when initialized' do
    it 'contains menu with dishes and prices in a hash' do
      expect(menu.dishes).to eq(dishes)
    end
  end

  describe '#print_menu' do
    printed_menu = "Prawn Crackers - £1.51, Prawn Gyoza - £3.51, Chicken Gyoza - £3.11, Spring Rolls - £3.15"
    it 'prints all menu items with prices' do
      expect(menu.print).to eq(printed_menu)
    end
  end

end
