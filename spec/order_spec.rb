require 'order'

describe Order do
  let(:p_pizza) { double(:dish, name: "Pepperoni Pizza", price: 9.50) }
  let(:m_pizza) { double(:dish, name: "Margherita Pizza", price: 7.50) }
  let(:menu) { double(:menu, dishes: [p_pizza, m_pizza] ) }
  subject(:order) { described_class.new(menu) }
  describe "#my_order" do
    it "initializes with an empty order list" do
      expect(subject.my_order).to eq []
    end
  end

  describe "#add" do
    it "allows items to be added to the order" do
      subject.add("Pepperoni Pizza")
      subject.add("Margherita Pizza")
      expect(subject.my_order).to eq [p_pizza, m_pizza]
    end

    it "allows multiple of the same item to be added" do
      subject.add("Pepperoni Pizza", 2)
      expect(subject.my_order).to eq [p_pizza, p_pizza]
    end
  end

  describe "#order_cost" do
    it "returns the total cost of the order" do
      subject.add("Pepperoni Pizza")
      subject.add("Margherita Pizza")
      expect(subject.order_cost).to eq 17
    end
  end
end
