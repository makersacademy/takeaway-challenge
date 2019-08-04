require 'menu'

describe Menu do
  
  let(:menu_item) { "1. Spaghetti Bolognese £6.50" }

  describe "#menu_items" do
    # Test to check whether dishes have prices
    it "has a price" do
      expect(subject.menu_items.values).to all( be_a(Float) )
    end
  end

  describe '#menu_list' do
    # Test to check if sample menu prints on the screen
    it 'shows a menu' do
      expect(subject.menu_list).to include  menu_item
    end
  end

end
