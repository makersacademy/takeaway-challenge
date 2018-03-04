require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:takeaway) { double :takeaway }
  let(:menu) { double :menu }

  describe "allows customers to place an order" do

    it "selects some number of several dishes" do
      expect {
        order.add_item("egg fried rice", 1)
        order.add_item("sweet & sour chicken", 2)
      }.to change { order.item }
    end

    it "returns a message when item is added to the basket" do
      expect {
        order.add_item("egg fried rice", 1)
        order.add_item("sweet & sour chicken", 2)
      }.to output("1x egg fried rice(s) added to your basket.\n2x sweet & sour chicken(s) added to your basket.\n").to_stdout
    end

    it "adds items to the basket" do
      order.add_item("egg fried rice", 1)
      order.add_item("sweet & sour chicken", 2)
      expect(order.basket).to eq [{ dish: "egg fried rice", quantity: 1, subtotal: 2.10 }, { dish: "sweet & sour chicken", quantity: 2, subtotal: 11.00 }]
    end
  end

  describe "allows customers to check their order" do

    before do
      order.add_item("egg fried rice", 1)
      order.add_item("sweet & sour chicken", 2)
    end

    it "reports the basket items" do
      expect { order.check_basket }.to output("1x egg fried rice for 2.10\n2x sweet & sour chicken for 11.00\nTotal price: 13.10\n").to_stdout
    end

  end

end
