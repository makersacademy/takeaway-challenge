require 'order'

describe Order do
  let(:p_pizza) { double(:dish, name: "Pepperoni Pizza", price: 9.50) }
  let(:m_pizza) { double(:dish, name: "Margherita Pizza", price: 7.50) }
  let(:menu) { double(:menu, dishes: [p_pizza, m_pizza] ) }
  let(:message_class) { double(:message_class, send: true, new: true ) }
  subject(:order) { described_class.new(menu, message_class) }
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
    it "raises an error if the item is not on the menu" do
      error_message = "This item is not on the menu"
      expect{subject.add("Escargot", 42)}.to raise_error(error_message)
    end
  end

  describe "#order_cost" do
    it "returns the total cost of the order" do
      subject.add("Pepperoni Pizza")
      subject.add("Margherita Pizza")
      expect(subject.order_cost).to eq 17
    end
  end

  describe "#confirm" do
    it "returns an error if the payment is not enough" do
      subject.add("Pepperoni Pizza")
      subject.add("Margherita Pizza")
      message = "You have not paid enough, The total is £17.00"
      expect{subject.confirm(5)}.to raise_error(message)
    end
    it "returns a message if the payment is enough" do
      allow(subject).to receive(:del_time) {"18:00"}
      subject.add("Pepperoni Pizza")
      subject.add("Margherita Pizza")
      expect(subject).to respond_to(:confirm)
    end
  end
end
