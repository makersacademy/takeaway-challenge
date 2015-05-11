require 'menu'
require 'takeaway'

describe Takeaway do
let(:subject){Takeaway.new Menu, Order, Message_Handler} #is this a dependency?

  it "has a menu" do
    expect(subject.main_menu).to eq :FishAndChips=>5, :MeatAndTwoVeg=>7
  end
  it "can show a formatted menu" do
    expect(subject.show_menu).to eq :FishAndChips=>5, :MeatAndTwoVeg=>7
  end

  it "can add to the main menu" do
    subject.add_to_main_menu :Pasta, 6
    expect(subject.main_menu.length).to eq 3
  end

  it "can take an order" do
    subject.take_order :FishAndChips, 3
    expect(subject.current_order.length).to eq 3
  end

  it "can allow a customer to check order value" do
    subject.take_order :FishAndChips, 3
    subject.check_order
    expect(subject.order_obj.order_cost).to eq 15
  end

  it "can allow a customer to remove an order and throw error if empty" do
    subject.take_order :FishAndChips
    subject.remove_order_item 1
    expect{subject.confirm_order}.to raise_error "No items in basket"
  end
end
