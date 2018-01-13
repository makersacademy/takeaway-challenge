require './lib/menu.rb'

describe Menu do

  context '#initialize' do
    subject(:menu_class)        { described_class.new(mock_menu) }
    let(:mock_menu)             { [{ dish: "Enchanted Suace", price: 12 }] }

    it "Should create a menu" do
      expect(menu_class.menu).to eq(mock_menu)
    end
  end

  context '#find_dish' do
    subject(:menu_class)        { described_class.new(mock_menu) }
    let(:mock_menu)             { [{ dish: "Enchanted Suace", price: 12 }] }
    let(:food_name)             { "Enchanted Suace" }

    it "Should display the dish information from menu" do
      expect(menu_class.find_dish(food_name)).to eq(mock_menu)
    end
  end

  context '#print_menu' do
    subject(:menu_class)        { described_class.new(mock_menu) }
    let(:mock_menu)             { [{ dish: "Enchanted Sauce", price: 12 }] }
    let(:mock_print)            { "Enchanted Sauce --- £12\n" }

    it "Should print menu nicely" do
      expect { menu_class.print_menu }.to output(mock_print).to_stdout
    end
  end
end
