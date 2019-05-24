require "order"

describe Order do
  let(:order) { Order.new(menu_class) }
  let(:menu_class) { double(:menu_class, :new => menu) }
  let(:menu) { double(:menu) }
  it "lists items ordered" do
    allow(menu).to receive(:cost_of)
    order.add("Soup", 1)
    expect(order.items.size).to eq(1)
  end
  it "finds out the price" do
    expect(menu).to receive(:cost_of)
    order.get_the_cost_from_menu("Soup")
  end

  it "shows the full order" do
    allow(menu).to receive(:cost_of)
    order.add("Soup", 1)
    expect { order.show }.to output(a_string_including("You are ordering:")).to_stdout
  end

  it "knows how much it costs" do
    allow(menu).to receive(:cost_of).and_return(5.99)
    order.add("Soup", 3)
    allow(menu).to receive(:cost_of).and_return(12.99)
    order.add("Burger", 2)
    expect(order.cost).to eq(43.95)
  end
end
