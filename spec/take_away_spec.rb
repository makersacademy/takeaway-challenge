require 'take_away'
describe TakeAway do

  subject(:takeaway) { described_class.new(name, price) }
  let(:name) { double(:name) }
  let(:price) { double(:price) }

  it "takeaway to know it's dishes" do
    expect(takeaway.name).to eq(name)
  end
  it "takeaway to know it's prices" do
    expect(takeaway.price).to eq(price)
  end
end
