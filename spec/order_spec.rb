require 'order'

describe Order do
  let(:menu) { class_double("test menu", view: "listed menu") }
 
  describe "#add" do
    it "it confirms the quantity and dishes added" do
      expect(subject.add(:fish, 2)).to eq(
        "You added 2 fish dishes to your order"
        )
    end
  end

  describe "#view_menu" do
    it "it outputs the menu" do
      order = Order.new(menu)
      expect(order.view_menu).to eq("listed menu")
    end
  end

  describe "#check" do
    it "returns total dishes and price of order" do
      subject.add("pizza")
      subject.add("curry", 2)
      expect(subject.check_order).to eq("You ordered 3 dishes totalling £32")
    end
  end

end