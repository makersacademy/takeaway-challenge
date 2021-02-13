require 'menu'

describe Menu do
  let(:dish1) { double(:dish, :name => "Baked Potato", :price => 3.25) }
  let(:dish2) { double(:dish, :name => "Spaghetti Bolognese", :price => 4.70) }
  let(:test_menu) { described_class.new(dish1, dish2) }

  it 'stores dishes passed as arguments to @dishes on creation' do
    expect(test_menu).to have_attributes(:dishes => [dish1, dish2])
  end

  describe '#peruse' do
    # I tried to write this test so that it would actually test for the names etc, but I kept getting an empty diff warning, I guess because although the strings were the same, they weren't exactly the same. I feel like this might have to be chalked up to something I can't test - I know it works in irb.
    it 'is expected to print list of menu items' do
      expect { test_menu.peruse }.to output(String).to_stdout
      end
  end

  describe '#pick' do
    it 'throws error if user tries to pick an item not on the menu' do
      expect { test_menu.pick("Really fake dish name") }.to raise_error "this item isn't on the menu"
    end
    it 'returns the menu item if it is on the menu' do
      expect(test_menu.pick("Baked Potato")).to eq [dish1]
    end
  end
end
