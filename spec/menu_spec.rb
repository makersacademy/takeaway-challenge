require 'menu'

describe Menu do

  subject(:menu) { described_class.new("Dominos",
  "Cheese & Tomato", 6,
  "Mighty Meaty", 9,
  "Pepperoni Passion", 8,
  "Tandoori Hot", 9,
  "Vegi Sizzler", 8)
  }

  describe 'initialization' do
    it 'has a name' do
      expect(menu.name).to eq "Dominos"
    end

    it 'has a list of dishes' do
      expect(menu.dishes.count).to eq 5
    end

    context 'invalid data while creating menu' do
      it 'fails for invalid data in dish name' do
        message = "Invalid dish name '9'"
        expect { Menu.new("Dominos", "Cheese & Tomato", 6, 9) }.to raise_error message
      end

      it 'fails for invalid data in dish price' do
        message = "Invalid dish price ''"
        expect { Menu.new("Dominos", "Cheese & Tomato", 6, "Mighty Meaty") }.to raise_error message
      end

      it 'fails for dish price not greater than zero' do
        message = "Invalid dish price '0'"
        expect { Menu.new("Dominos", "Cheese & Tomato", 6, "Mighty Meaty", 0) }.to raise_error message
      end

      it 'fails for no dishes' do
        expect { Menu.new("Dominos") }.to raise_error "No dishes in the menu"
      end
    end

  end

end
