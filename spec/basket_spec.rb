require 'basket'

describe Basket do

  let(:basket) { subject }

  it "should have an attribute reader items" do
    expect(subject.items).to eq({})
  end
end
