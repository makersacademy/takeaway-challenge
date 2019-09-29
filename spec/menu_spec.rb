require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#initialize' do
    it 'contains a hash of food items and their prices' do
      expect(menu.items).to be_a Hash
    end
  end

  describe '#view_items' do
    let(:expected_output) {
      ["MENU:",
       "Pizza -- £6",
       "Burger -- £5",
       "Fries -- £3",
       "Milkshake -- £3",
       "Soda -- £1"].join("\n")
    }
    it 'viewing the items should display the full menu and prices' do
      expect { menu.view_items }.to output(expected_output).to_stdout
    end
  end

end
