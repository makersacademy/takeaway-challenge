require './lib/order'
require './lib/menuitems'

describe Order do
  subject(:order) { described_class.new(items) }

  let(:customer_order) do
    { bbq_chicken: 3, vegan: 2, hawaiian: 3 }
  end

  before do
    allow(items).to receive(:has_item?).with(:bbq_chicken).and_return(true)
    allow(items).to receive(:has_item?).with(:vegan).and_return(true)
    allow(items).to receive(:has_item?).with(:hawaiian).and_return(true)

    allow(items).to receive(:has_item?).with(:meat_feast).and_return(false)
    
    allow(items).to receive(:price).with(:bbq_chicken).and_return(12.99)
    allow(items).to receive(:price).with(:vegan).and_return(14.99)
    allow(items).to receive(:price).with(:hawaiian).and_return(18.99)

    allow(items).to receive(:menuitems).and_return(customer_order)
  end

  let(:items) { instance_double("MenuItems") }

  describe "items" do
    context "stores the customer order" do
      it "returns the current order" do
        subject.add(:bbq_chicken, 3)
        subject.add(:vegan, 2)
        subject.add(:hawaiian, 3)
        expect(subject.items.menuitems).to eq(customer_order)
      end
    end
  end

  describe "#add" do
    context "totals the order" do
      it "places an order X amount of times and returns expected cost" do
        subject.add(:bbq_chicken, 3)
        subject.add(:vegan, 2)
        subject.add(:hawaiian, 3)
        total_cost = 125.92
        expect(subject.basket).to eq(total_cost)
      end

      it "rejects items not in stock" do
        allow(items).to receive(:has_item?).with(:meat_feast).and_return(false)
        expect { order.add(:meat_feast, 1) }.to raise_error "Sorry meat_feast is out of stock"
      end
    end
  end

  describe "#basket" do
    context "it calls calculate_basket, creates a key/value hash and returns the total" do
      it "returns the baskets total" do
        order.add(:bbq_chicken, 3)
        order.add(:vegan, 2)
        order.add(:hawaiian, 3)
        total = 125.92
        expect(order.basket).to eq(total)
      end
    end
  end
end
