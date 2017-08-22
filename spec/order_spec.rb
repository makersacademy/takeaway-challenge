require 'order'
require 'order_item'

describe Order do
  let(:order) { described_class.new (["1 2"])}
  let(:order_item) { double :order_item }
  let(:order_item2) { double :order_item2 }

  it "generates and stores order items from the user input string" do
    order.generate_order_items
    expect(order.contents.all? {|item| item.is_a?(OrderItem) }).to eq true
  end

  it "calculates the order total" do
    order.generate_order_items
    expect(order.calc_total).to eq 16
  end

  it "shows the order with each item, it's cost and a total" do
    expect { order.show }.to output("Chicken Korma 2 X £8 = £16\nTotal = £16\n").to_stdout
  end

  

end
