require 'takeaway'

describe TakeAway do
  subject (:takeaway) {TakeAway.new}

  describe "default" do
    it "creates a new instance of Menu and sets as instance variable" do
      expect(takeaway.menu).to be_instance_of Menu
    end
    it "creates a new instance of Basket and sets as instance variable" do
      expect(takeaway.basket).to be_instance_of Basket
    end
    it "creates the instance variable total_price and sets it to 0" do
      expect(takeaway.total_price).to be 0
    end
    it "creates a new instance of Messenger and sets as instance variable" do
      expect(takeaway.messenger).to be_instance_of Messenger
    end
  end

  describe "#view_menu" do
    it "sends message to menu to print menu" do
      takeaway.menu.add_to_menu("Pizza", 4.95)
      expect {takeaway.view_menu}.not_to raise_error
    end
  end

  describe "#order" do
    it { is_expected.to respond_to(:order).with(2).arguments }

    context "when the user specifies only the selected dish" do
      it "sends message to add dish to basket" do
        takeaway.menu.add_to_menu("Pizza", 4.95)
        takeaway.order("Pizza")
        expect(takeaway.view_basket).to include ({"Pizza" => 4.95})
      end
    end
    context "When the user specifies the dish and a quantity" do
      it "sends message to basket to add specified quantity of dish to basket" do
        takeaway.menu.add_to_menu("Pizza", 4.95)
        takeaway.order("Pizza", 5)
        expect((takeaway.view_basket).length).to eq 5
      end
    end
  end

  describe "#view_basket" do
    it "shows the user the selected dishes" do
      takeaway.menu.add_to_menu("Chicken", 3.45)
      takeaway.order("Chicken")
      expect(takeaway.view_basket).to eq ([{"Chicken" => 3.45}])
    end
  end

  describe "#view_total" do
    it "shows the user the current total_price of their order" do
      takeaway.menu.add_to_menu("Chicken", 3.45)
      takeaway.order("Chicken")
      expect(takeaway.view_total).to eq ("The current total is £3.45")
    end
  end
end
