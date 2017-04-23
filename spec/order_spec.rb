require "order"

describe Order do
  it { is_expected.to be_an_instance_of Order }
  it { is_expected.to respond_to(:new_order) }

  describe "#initialize" do
    it "initializes with a new instance of the Menu class and @pending_order which equals nil" do
      expect(subject).to have_attributes(:menu => Menu.new.menu, :pending_order => [])
    end
  end

  describe "#new_order" do
    it "should place an order of 'Salad', 'Pasta', 'Ice Cream', 'Pepsi'" do
      subject.new_order
      expect(subject.pending_order).to eq(["Salad", "Pasta", "Ice Cream", "Pepsi"])
    end
  end

  describe "#review_order" do
    it "should check the default order against the menu and evaluate to true" do
      expect(subject.review_order).to eq(true)
    end
  end
end
