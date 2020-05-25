require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, message: message) } # to pass a menu instance when initalizing
  
  let(:menu) { double(:menu, read: menu_list) } # making a double of menu instance to have the read method with value of menu_list
  let(:order) { instance_double("Order", total: 16.50) }
  let(:message) { instance_double("Message", deliver: nil)}
  let(:menu_list) { "Hallomi £5.50, Chicken £5.99" } # let memory helper to remember the value of menu_list
  
  let(:dishes) { {breadsticks: 2, fish: 1} }
  
  before do
    allow(order).to receive(:add)
  end

  it "shows the menu with dishes and prices" do
    expect(takeaway.show_menu).to eq(menu_list)
  end

  it "can order some numbers of available dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it "knows the total of the order" do
    total = takeaway.place_order(dishes)
    expect(total).to eq(16.50)
  end

  it "sends an message when the order has been placed" do
    expect(message).to receive(:deliver)
    takeaway.place_order(dishes)
  end
end