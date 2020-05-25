require 'order'

describe Order do

  let(:withorder) { Orders.new.input_order("soup") }

  it "is an order" do
    expect(subject).to be_kind_of Order
  end

  it "stores an order" do
    expect(subject).to respond_to(:sum_cost).with(1).arguments
  end

  it "returns the customer order" do
    subject.sum_cost("soup")
    expect { subject.summary }.to output("your meal will cost £4\n").to_stdout
  end

  # it "confirms with the customer total price" do
  #   subject.input_order("soup")
  #   expect { subject.value }.to output("at a total cost of £12").to_stdout
  # end
end
