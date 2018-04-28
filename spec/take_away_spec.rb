require 'take_away'

describe TakeAway do

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu, :list => {"southern chicken" => 5.90} }

  describe "#initialize" do
    it "has a menu list" do
      expect(takeaway.menu).to eq menu
    end
  end

  describe "#read_menu" do
    it "returns the menu" do
      expect(takeaway.read_menu).to eq menu.list
    end
  end

  describe "#order" do
    it "adds the dishes to the basket" do
      takeaway.order("southern chicken", quantity = 1)
      expect(takeaway.basket.length).to eq 1
    end

    it "prints the message" do
      dish = "southern chicken"
      expect(takeaway.order(dish, quantity = 1)).to eq "#{quantity}x #{dish}(s) added to your basket"
    end
  end

  describe "#basket" do
    let(:menu) {double :menu, list: ["mamas meatballs", "chicken curry"]}
    it "allows to add same dish more than once to the basket" do
      takeaway.order("mamas meatballs")
      takeaway.order("mamas meatballs",2)
      expect(takeaway.basket).to eq ({"mamas meatballs"=>3})
    end

    it "allows to add multiple dishes to the basket" do
      takeaway.order("mamas meatballs")
      takeaway.order("chicken curry",2)
      expect(takeaway.basket).to eq ({"mamas meatballs"=>1, "chicken curry"=>2})
    end
  end

  describe "#basket_summary" do
    let(:menu) {double :menu, list: {"jerk chicken" => 5.59, "mamas meatballs" => 5.39} }
    it "shows the prices for each ordered item" do
      takeaway.order("jerk chicken", 1)
      takeaway.order("mamas meatballs", 2)
      expect(takeaway.basket_summary).to eq ("jerk chicken x1 = £5.59, mamas meatballs x2 = £10.78")
    end
  end

  describe "#total" do
    let(:menu) {double :menu, list: {"jerk chicken" => 5.59, "mamas meatballs" => 5.39} }
    it "shows total price for the order" do
      takeaway.order("jerk chicken", 1)
      takeaway.order("mamas meatballs", 2)
      expect(takeaway.total).to eq "Total: £16.37"
    end
  end

  describe "#checkout" do
  let(:menu) {double :menu, list: {"jerk chicken" => 5.59, "mamas meatballs" => 5.39} }
    it "returns message that order is complete" do
      takeaway.order("jerk chicken", 1)
      takeaway.order("mamas meatballs", 1)
      time = (Time.new + 3600).strftime("%H:%M")
      takeaway.basket_summary
      takeaway.total
      expect(takeaway.checkout(10.98)).to eq "Thank you! Your order was placed and will be delivered before #{time}"
    end

    it "returns message that order cannot be complete" do
      takeaway.order("jerk chicken", 1)
      takeaway.order("mamas meatballs", 1)
      expect { takeaway.checkout(16.89) }.to raise_error "Check your total as it is incorrect"
    end

  end
end
