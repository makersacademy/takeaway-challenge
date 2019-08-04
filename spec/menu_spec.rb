require 'menu'

describe Menu do
  
  let(:menu_item) { "1. Spaghetti Bolognese £6.50" }

  describe '#view_menu' do
    # Test to check if example menu prints on the screen
    it 'shows a menu' do
      expect(subject.view_menu).to include  menu_item
    end
  end

  describe "#list" do
    # Test to check whether dishes have prices
    it "has a price" do
      expect(subject.menu_items.values).to all( be_a(Float) )
    end


  end

end
