require "order"

describe Order do
  let(:menu) { double(:menu, dishes: { sriuba: 2, bob: 3 } )}
  let(:text) { double(:text)}
  let(:menu_class) { double(:Menu, new: menu) }
  let(:text_class) { double(:Text, new: text)}
  subject(:order) { described_class.new(menu: menu_class, text: text_class) }

  it "order should start empty" do
    expect(order.current_order).to eq []
  end

  describe "#view_menu" do
    it "should be able to view the menu while ordering" do
      expect(menu).to receive(:dishes)
      order.view_menu
    end
  end

  describe "#view_order" do

    it "should respond with the order and the total" do
      order.add :sriuba
      expect(order.view_order).to eq 'Your order: [{:sriuba=>2}]. Your total: £2'
    end
  end

  describe "#add" do
    it "should add a meal to order" do
      expect(order.add(:sriuba)).to eq [{:sriuba=>2}]
    end

    it "should raise error if trying to add a meal that isn't on the menu" do
      expect{order.add("Chicken")}.to raise_error "This is not on the menu!"
    end
  end

  describe "#remove" do
    it "should remove food from the order" do
      order.add :sriuba
      order.add :bob
      expect(order.remove(:bob)).to eq [{:sriuba => 2}]
    end

    it "should raise error if trying to remove a meal that isn't on the menu" do
      expect{order.remove("Chicken")}.to raise_error "This is not on the menu!"
    end
  end

  describe "#checkout" do
    it "should set @current_order to be empty" do
      order.checkout
      expect(order.current_order).to eq []
    end
  end
end
