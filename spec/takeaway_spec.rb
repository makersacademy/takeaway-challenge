require "takeaway"

describe Takeaway do
  let(:menu) { double :menu }
  subject(:takeaway) { described_class.new(menu)}

  it "has a menu with a list of dishes and prices" do
    menu_items = [Dish.new("pie", 5), Dish.new("pizza", 6)]
    allow(menu).to receive(:items).and_return menu_items

    expect(takeaway.view_menu).to eq menu_items
  end

  context "ordering menu items" do
    let(:pie) { Dish.new('pie', 5) }
    before do
      allow(menu).to receive(:order).with("pie").and_return pie
    end

    it "orders an item from the menu" do
      expect(takeaway.order_item("pie").item).to eq pie
    end

    it "orders a given quantity of an item from the menu" do
      expect(takeaway.order_item("pie", 2).quantity).to eq 2
    end
  end

  context "reviewing an order" do
    before do
      pie = Dish.new("pie", 5)
      pizza = Dish.new("pizza", 6)
      chips = Dish.new("chips", 3)
      allow(menu).to receive(:order).with("pie").and_return pie
      allow(menu).to receive(:order).with("pizza").and_return pizza
      allow(menu).to receive(:order).with("chips").and_return chips
    end

    it "shows a total of zero when no items ordered" do
      expect(takeaway.review_order).to eq "Order total: £0"
    end

    it "shows an ordered item with cost and total cost" do
      takeaway.order_item("pie")

      expect(takeaway.review_order).to eq "1 x pie: £5, Order total: £5"
    end

    it "shows all ordered items and costs" do
      takeaway.order_item("pie")
      takeaway.order_item("pizza")

      expect(takeaway.review_order).to eq "1 x pie: £5, 1 x pizza: £6, Order total: £11"
    end

    it "shows all ordered items with different quantities and total costs" do
      takeaway.order_item("pie")
      takeaway.order_item("pizza", 2)
      takeaway.order_item("chips", 3)

      expect(takeaway.review_order).to eq "1 x pie: £5, 2 x pizza: £12, 3 x chips: £9, Order total: £26"
    end
  end

  context "checking out an order" do
    it "raises an error if no items have been ordered" do
      expect { takeaway.checkout(5) }.to raise_error "You haven't ordered any items!"
    end

    it "raises an error if no amount is given" do
      pie = Dish.new("pie", 5)
      allow(menu).to receive(:order).with("pie").and_return pie
      takeaway.order_item("pie")

      expect { takeaway.checkout }.to raise_error "Please pay the correct amount!"
    end

    it "raises an error if the wrong amount is given" do
      pie = Dish.new("pie", 5)
      allow(menu).to receive(:order).with("pie").and_return pie
      takeaway.order_item("pie")

      expect { takeaway.checkout(2) }.to raise_error "Please pay the correct amount!"
      expect { takeaway.checkout(6) }.to raise_error "Please pay the correct amount!"
    end

    # it "checks out an order when given the correct amount" do
    #   time = Time.now + 1
    #   expect(takeaway.checkout(amount)).to eq "Thank you! Your order was placed and will be delivered before #{time}"
    # end

  end

end
