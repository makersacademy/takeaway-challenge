require_relative "../lib/menu.rb"

describe Menu do

  let(:menu) { Menu.new }

  before do

  end

  describe "#print_carte_dishes" do
    xit "prints the menu in the console" do
      # ASK ABOUT THIS - TESTING A PUTS IN A ITERATOR
      # expected_values = {"Arepa": 7.00, "Yuca": 5.00}
      expect { menu.print_menu_dishes }.to output("Arepa  £7.0\nYuca  £5.0\n").to_stdout
    end
  end

  describe "#menu_checker" do
    it "raises an error if dish is not found in the list_of_dishes" do
      expect { menu.menu_checker("baguette") }.to raise_error(MenuError)
    end
  end

  describe "#get_name" do

    it "returns the name of the dish in the list_of_dishes. Given 'arepa'." do
      expect(menu.get_name("arepa")).to eq "Arepa"
    end

    it "raises an error if the name of the dish is not in the list_of_dishes. Given 'baguette'." do
      expect { menu.get_name("baguette") }.to raise_error(MenuError)
    end
  end
end
