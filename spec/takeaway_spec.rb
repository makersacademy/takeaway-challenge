require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}
  let(:menu) {Menu.new}
  let(:order) {Order.new}

  it " creates an instance of the class" do
    expect(takeaway).to be_instance_of(Takeaway)
  end

  describe "#see_menu" do
    it "lists the menu to the user" do
    expect(takeaway.see_menu).to eq(menu.menu_list)
    end
  end

  describe '#make_an_order' do
    it "receives an argument, the item number" do
      expect(takeaway).to respond_to(:make_an_order).with(1).argument
    end

    it "adds the item hash into the order selection" do
     takeaway.make_an_order(1)
     expect(takeaway.order.current_order).not_to be_empty
    end
  end

  describe '#checkout_price' do
    it "calculates to total price of selected items" do
      takeaway.make_an_order(3)
      takeaway.make_an_order(4)
      expect(takeaway.checkout_price).to eq takeaway.order.total_price
    end
  end

  describe '#confirm_order' do
    it "raises an error when no items have been selected" do
      expect{takeaway.confirm_order}.to raise_error "Your checkout basket is empty"
    end
  end

end
