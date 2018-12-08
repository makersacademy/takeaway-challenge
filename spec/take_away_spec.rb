require 'take_away'
describe TakeAway do

  subject(:takeaway) { described_class.new }
  let(:dish) { double(:dish) }
  describe 'A TakeAway' do
    it "know it's dishes" do
      expect(takeaway.dish['fried chicken']).to(be_a Float)
    end

    it "can list dishes with prices" do
      expect(takeaway).to respond_to(:list)
      expect(takeaway.list).to be_truthy
    end
  end

end
