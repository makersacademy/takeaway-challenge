require 'menu'

describe Menu do
  let(:dish1) { double(:dish, :name => "Baked Potato", :price => 3.25) }
  let(:dish2) { double(:dish, :name => "Spaghetti Bolognese", :price => 4.70) }
  let(:dish3) { double(:dish, :name => "Ham Sandwich", :price => 2.65) }
  let(:dish4) { double(:dish, :name => "Tartiflette", :price => 6.80) }
  let(:test_menu) { described_class.new("Fake Ass Restaurant") }

  describe '#initialize' do
    it 'has an empty array of dishes' do
      expect(test_menu.dishes).to eq []
    end
    it 'has stored title' do
      expect(test_menu.title).to match(/^Fake Ass Restaurant$/)
    end
  end

  describe '#add_dishes' do
    it 'stores dishes passed as arguments to @dishes on creation as an array of hashes' do
      test_menu.add_dishes(dish1, dish2)
      expect(test_menu).to have_attributes(:dishes => [dish1, dish2])
    end
  end

  context 'dishes have been added' do
    before(:each) { test_menu.append(dish1, dish2) }
    describe '#peruse' do
      it 'is expected to print list of menu items' do
        expect { test_menu.peruse }.to output(String).to_stdout
      end
    end

    describe '#append' do
      it 'throws an error if trying to append items already on the menu' do
        expect { test_menu.append(dish2) }.to raise_error "this item is already on the menu!"
      end
      it 'can add multiple items at once' do
        expect { test_menu.append(dish3, dish4) }.to change { test_menu.dishes.length }.by 2
      end
    end

    describe '#pick' do
      it 'throws error if user tries to pick an item not on the menu' do
        expect { test_menu.pick("Really fake dish name") }.to raise_error "this item isn't on the menu"
      end
      it 'returns the menu item if it is on the menu' do
        expect(test_menu.pick("Baked Potato")).to eq(dish1)
      end
    end
  end
end
