require 'takeaway'

describe Takeaway do

  let(:menu_class){ double :menu_class, new: menu }
  let(:menu){ double :menu }
  let(:dish){ double :dish, price: 3 }
  subject(:takeaway){ described_class.new(menu_class) }

  describe "#read_menu" do
    it "displays list of dishes with prices" do
      expect(takeaway.read_menu).to eq menu
    end
  end

  describe "#order" do
    it "orders a dish and places in basket" do
      expect(takeaway.order(dish)).to eq [dish]
  end

  describe "#view_order" do
    it "displays list of ordered dishes in basket" do
      allow(takeaway).to receive(:basket){[dish, dish]}
      expect(takeaway.view_basket).to eq [dish, dish]
    end
  end

  describe "#verify_order" do
    it "confirms the price of customer's order" do
      allow(takeaway).to receive(:basket){[dish, dish]}
      expect(takeaway.total).to eq dish.price * 2
    end
  end
end
end
