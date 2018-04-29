require 'basket'

describe Basket do

  let(:basket) { subject }

  it "should have an attribute reader orders" do
    expect(subject.orders).to eq({})
  end
end
