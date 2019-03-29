require "order"

describe Order do
  let(:dish_double) { double :dish, print_dish: "true", id: 81, price: 1 }
  let(:dish_class) { double :dish_class, new: dish }
  let(:menu) { double :menu, print_dish: true, get_by_id: dish_double }
  let(:subject) { described_class.new(menu) }
  let(:texting_class) { double :texting, send_sms: "algo" }
  describe "#initialize" do
    it "makes empty order" do
      expect(subject.dishes).to be_empty
    end
  end

  describe "#add_to_order" do
    it "adds a dish to the order with given quantity" do
      subject.add_to_order(dish_double.id, 2)
      hash = { :dish => dish_double, :quantity => 2 }
      expect(subject.dishes).to include hash
    end
  end

  describe "#remove_from_order" do
    it "removes a dish from the order" do
      subject.add_to_order(dish_double.id, 1)
      hash = { :dish => dish_double, :quantity => 1 }
      subject.remove_from_order(dish_double.id)
      expect(subject.dishes).not_to include hash
    end
  end

  describe "#check_order" do
    it "print the dishes in the order" do
      subject.add_to_order(dish_double.id, 1)
      subject.check_order
      expect(dish_double).to have_received(:print_dish)
    end
  end

  describe "#place_order" do
    it "sends a text" do
      subject.place_order(texting_class)
      expect(texting_class).to have_received(:send_sms)
    end
  end
end
