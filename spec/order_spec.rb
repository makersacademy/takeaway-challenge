require "order"

describe Order do

  let(:menu)      {double :menu, check_menu: [["Chicken", 10], ["Steak", 15]]}

  describe "#see_menu" do
    it "should return a list of dishes and prices" do
      menu_class_double = double :menu_class, new: menu
      order = Order.new(menu_class_double)
      expect(order.see_menu).to eq [["Chicken", 10], ["Steak", 15]]
    end
  end

end