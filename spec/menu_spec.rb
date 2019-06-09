require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#items' do

    it 'should be an array' do
      expect(menu.items).to be_instance_of(Array)
    end

    it "should store the menu items as hashes" do
      expect(menu.items).to all be_a(Hash)
    end

    it "includes item key for each item" do
      expect(menu.items.first).to have_key(:item)
    end

    it "includes price key for each item" do
      expect(menu.items.first).to have_key(:price)
    end
  end

  describe '#display' do
    it "should show a list of dishes with prices" do
      expect { menu.display }.to output(/Menu/).to_stdout
      expect { menu.display }.to output(/Margarita £9/).to_stdout
    end
  end
end
