require "menu"

describe Menu do
  it "has a menu" do
    expect(subject.list.count).to eq 4
  end

  describe "#add_to_order" do
    it "rejects order when not on menu" do
      expect { subject.add_to_order("pasta") }.to raise_error "I'm sorry we don't have that dish"
    end
    it "adds meal to order" do
      subject.add_to_order("Margherita")
      expect(subject.order.pop).to eq({ name: "Margherita", price: 2 })
    end
  end
end
