require "menu"

describe Menu do
  subject(:menu) { described_class.new }
  dishes = { "Pepperoni Pizza" => 6, "Fish & Chips" => 4, "Chicken Jalfrezi" => 7, "Chow Mein" => 5, "Ceasar Salad" => 3 }

  describe "#print menu" do

  it 'should print the list of dishes and prices' do
      expect(menu.print_menu).to eq dishes
      end
    end


end
