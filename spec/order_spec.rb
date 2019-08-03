require 'order'

describe Order do

  let(:burger) { double("burger", name: "burger", price: 15) }
  let(:pasta) { double("pasta", name: "pasta", price: 10) }
  let(:sushi) { double("sushi", name: "sushi", price: 22) }
  let(:menu) { double("menu", :dishes_list => [burger, pasta]) }
  let(:items) { double("order_items", :list => { "burger" => 2, "pasta" =>1 }) }
  let(:empty_items) { double("empty order list", :list => {}) }
  let(:restaurant) { double("restaurant", menu: menu) }

  subject { Order.new(restaurant, items) }

  describe "#checkout" do
    it "calls lock on the items" do
      allow(items).to receive(:lock)
      subject.checkout
      expect(items).to have_received(:lock)
    end

    it "raises an error if the order is empty" do
      subject = Order.new(restaurant, empty_items)
      allow(empty_items).to receive(:lock)
      expect{ subject.checkout }.to raise_error "Empty basket!"
    end
  end

  describe "#checked_out?" do
    it "returns false when order isn't closed" do
      expect(subject).not_to be_checked_out
    end

    it "returns true when order is closed" do
      allow(items).to receive(:lock)
      subject.checkout
      expect(subject).to be_checked_out
    end
  end 

  describe "#total_price" do
    it "returns the total" do
      expect(subject.total_price).to eq 40
    end
  end
end
