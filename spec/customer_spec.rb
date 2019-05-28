require "customer"

describe Customer do
  subject(:customer) { described_class.new(menu_class, order_class, message_class) }
  let(:menu_class) { double(:menu_class, :new => menu) }
  let(:menu) { double(:menu) }
  let(:order_class) { double(:order_class, :new => order) }
  let(:order) { double(:order) }
  let(:dish) { double(:dish, :name => "Soup") }
  let(:message_class) { double(:message_class, :new => message) }
  let(:message) { double(:message) }

  it "looks at the nemu" do
    expect(menu).to receive(:show)
    customer.look
  end
  it "selects dishes" do
    expect(order).to receive(:add)
    customer.choice(dish, 2)
  end

  it "verifies total cost" do
    allow(order).to receive(:cost).and_return(14)
    expect { customer.checkout(10) }.to raise_error("You are charging me the incorrect price")
  end

  it "successfully places order" do
    allow(order).to receive(:cost).and_return(14)
    allow(message).to receive(:send)
    expect { customer.checkout(14) }.to output(a_string_including("You will pay £14")).to_stdout
  end
end
