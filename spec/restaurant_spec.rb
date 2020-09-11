require 'restaurant'

describe Restaurant do
  let(:restaurant) { Restaurant.new }

  it 'initializes with a menu array' do
    expect(restaurant).to respond_to(:menu)
  end
  
  describe '#place_order' do
    it 'responds to #place_order' do
      expect(restaurant).to respond_to(:place_order)
    end

    
  end

  describe '#view_menu' do
    test_menu = ["Salmon" => 12]
    restaurant = Restaurant.new(test_menu)
    it "puts's the menu with an item number" do
      expect(restaurant.view_menu).to eq (["Salmon - £12"])
    end
  end

end