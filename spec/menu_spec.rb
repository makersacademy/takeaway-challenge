require 'menu'
describe Menu do
  let(:dish) { double("Dishes") }
  describe "#add_to_menu" do
    it "should add an object to the menu and increase the length of the array" do
      expect { subject.add_to_menu(dish) }.to change { subject.dishes.length }.by 1
    end
  end
  describe "#show_menu" do
    before(:example) do
      allow(dish).to receive(:name).and_return("Chicken Burger", "Fries")
      allow(dish).to receive(:price).and_return("5", "3")
      2.times do subject.add_to_menu(dish) end
    end
    it "should return a break down of the dishes available" do
      expect { subject.show_menu }.to output("Dish Name: Chicken Burger - Price: £5\nDish Name: Fries - Price: £3\n").to_stdout
    end
  end
end
