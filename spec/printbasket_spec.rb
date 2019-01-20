require 'printbasket'
require 'basket'
describe PrintBasket do
  before(:each) do
    @dish1 = Dish.new("katsu curry", 15)
    @dish2 = Dish.new("edamame", 3)
    @basket = Basket.new
    @basket.add(@dish1)
    @basket.add(@dish2)
    @basket.add(@dish2)
  end
  context "#basket_to_s" do
    it "displays basket as a string" do
      expect(subject.string(@basket)).to eq("katsu curry x 1 : £ 15.00\nedamame x 2 : £ 6.00\n\nTotal: £ 21.00\n")
    end
  end
end
