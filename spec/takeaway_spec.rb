require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:menu) {Menu.new}
  let(:new_order) {Order.new}



  describe "#print_menu" do
    it "prints the menu" do
      expect(takeaway.print_menu).to eq(menu.dishes_list)
    end
  end

  describe "#order" do
    it "starts a new order" do
      expect(takeaway.start_order).to eq(new_order.order)
    end

    it "adds the chicken dish to the order" do
      expect(takeaway.add_chicken).to eq(new_order.add_chicken)
    end

    it "add the lamb dish to the order" do
      expect(takeaway.add_lamb).to eq(new_order.add_lamb)
    end

    it "add the beef dish to the order" do
      expect(takeaway.add_beef).to eq(new_order.add_beef)
    end

    it "checks the order" do
      takeaway.add_beef
      new_order.add_beef
      expect(takeaway.check_order).to eq(new_order.check_order)
    end
  end
end
