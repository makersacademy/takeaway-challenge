require "menu"

describe Menu do
  let(:dish) { double :dish, print_dish: true, id: 81 }
  let(:dish_class) { double :dish_class, new: dish }
  let(:subject) { described_class.new(dish_class) }

  describe "#initialize" do
    it "initialize a menu with a few dishes" do
      expect(subject.dishes).not_to be_empty
    end
  end

  describe "#list" do
    it "list something" do
      subject.list
      expect(dish).to have_received(:print_dish)
    end
  end

  describe "#get_by_id" do
    it "gives a dish with the given id" do
      expect(subject.get_by_id(81)).to eq dish
    end
  end
end
