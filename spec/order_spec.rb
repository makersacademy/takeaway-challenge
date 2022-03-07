require "order"

RSpec.describe Order do
  subject { described_class.new(menu, message_sender) }
  let(:menu) { double(:menu, :dish? => true) }
  let(:message_sender) { double(:message_sender) }

  before do
    allow(menu).to receive(:price).with("some-dish").and_return(1)
    allow(menu).to receive(:price).with("another-dish").and_return(3)
  end

  it "can add some dishes from the menu" do
    subject.add("some-dish", 2)
    subject.add("another-dish", 1)

    expect(subject.dishes).to include("some-dish" => 2, "another-dish" => 1)
  end

  it "can add a dish from the menu repeatedly" do
    subject.add("some-dish", 1)
    subject.add("some-dish", 2)

    expect(subject.dishes).to include("some-dish" => 3)
  end

  it "fails to add a dish that is not on the menu" do
    allow(menu).to receive(:dish?).with("unknown dish").and_return(false)

    expect { subject.add("unknown dish", 1) }.
      to raise_error("'unknown dish' is not on the menu")
  end

  it "starts with a total of zero" do
    expect(subject.total()).to be_zero
  end

  it "can calculate the total price with one dish" do
    subject.add("some-dish", 1)

    expect(subject.total).to eq(1)
  end

  it "can calculate the total price with two dishes" do
    subject.add("some-dish", 1)
    subject.add("another-dish", 1)

    expect(subject.total).to eq(4)
  end

  it "can calculate the total price with some number of several dishes" do
    subject.add("some-dish", 2)
    subject.add("another-dish", 3)

    expect(subject.total).to eq(11)
  end

  it "fails to place an order with no dishes" do
    expect { subject.place }.to raise_error("cannot place an empty order")
  end

  it "can be placed" do
    allow(message_sender).to receive(:send_order_confirmation)
    subject.add("some-dish", 1)

    subject.place

    expect(message_sender).to have_received(:send_order_confirmation)
  end
end
