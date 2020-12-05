require 'menu'

describe Menu do
  let(:dish) { double :dish, name: "Pie", price: 5 }
  let(:dish_class) { double :dish_class, new: dish }
  subject {described_class.new(dish_class)}

  describe "add_dish" do
    it "adds a dish to the menu" do
    subject.add_dish("Pie", 5)
    expect(subject.dishes).to include(dish)  
    end
  end
end