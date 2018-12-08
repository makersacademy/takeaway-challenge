require 'take_away'
describe TakeAway do

  subject(:takeaway) { described_class.new }
  let(:dish) { double([:dish]) }

  it "know it's dishes" do
    takeaway.dish['fried chicken'] = 2.0
    expect(takeaway.dish['fried chicken']).to(be_a Float)
  end

end
