
require 'takeaway'

describe TakeAway do
  let(:summary) { double :"Pizza x 2, Fried Chicken x 3 = £19" }
  let(:order) { double :order, add: 'item', summary: summary, total: 19, checkout: 'checkout' }
  let(:order_class) { double :order, new: order }
  describe '#view_dishes' do
    it 'lets customer see a list of dishes with prices' do
      takeaway = TakeAway.new
      expect(takeaway.view_dishes).to eq("Hamburger £4, Hotdog £3, Pizza £5, Fried chicken £3")
    end
  end
  describe '#create_new_order' do
    it "starts a new order" do
      takeaway = TakeAway.new(order_class)
      takeaway.create_new_order
      expect(takeaway.view_order).to eq order
    end
  end
  describe '#add' do
    it "a customer can add a number of items to an order" do
      takeaway = TakeAway.new(order_class)
      takeaway.create_new_order
      takeaway.add("Pizza", 2)
      takeaway.add("Fried Chicken", 3)
      expect(takeaway.basket_summary).to eq summary
    end
  end
  describe '#total' do
    it "check that total is correct" do
      takeaway = TakeAway.new(order_class)
      takeaway.create_new_order
      takeaway.add("Pizza", 2)
      takeaway.add("Hotdog", 3)
      expect(takeaway.total).to eq(19)
    end
  end
  describe '#basket_summary' do
    it "shows summary of items" do
      takeaway = TakeAway.new(order_class)
      takeaway.create_new_order
      takeaway.add("Pizza", 2)
      takeaway.add("Hotdog", 3)
      expect(takeaway.basket_summary).to eq summary
    end
  end
  describe '#checkout' do
    it "runs checkout proceedure" do
      takeaway = TakeAway.new(order_class)
      takeaway.create_new_order
      takeaway.add("Pizza", 2)
      takeaway.add("Hotdog", 3)
      expect(takeaway.checkout).to eq 'checkout'
    end
  end
end
