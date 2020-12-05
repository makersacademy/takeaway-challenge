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

  describe "print_menu" do
    it "prints the full menu" do
      subject.add_dish("Pie", 5)
      expect(subject.print_menu).to eq "Pie: £5"
    end
  end

  describe "#check_total" do
    it "ensures the total order price is correct" do
      order = [dish, dish]
      expect(subject.check_total(order, 10)).to eq true
    end
  end
end