require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Pasta - £7, Pizza - £9, Canlone - £9" }
  let(:order_list) { {Pizza: 3} }

  it "should initialze with an empty order list array" do
    expect(order.order_list).to be_instance_of(Hash)
    expect(order.order_list).to be_empty
  end

  it "should print the menu" do
    expect(order.print_menu).to eq printed_menu
  end

  it "should add chosen dish number to the order list" do
    order.print_menu
    order.add(:Pizza, 3)
    expect(order.order_list).to eq order_list
  end


end
