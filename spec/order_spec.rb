require 'order'

describe Order do
  subject(:order) {described_class.new}
  
  describe "default" do
    it "starts with an empty basket" do
      expect(order.current_order).to be_empty
    end
  end
  
  it 'allows you to add items from the menu' do
    dish = "Egg Fried Rice"
    order.add_dish_to_basket dish
    expect(order.current_order).to include "Egg Fried Rice"
  end
end