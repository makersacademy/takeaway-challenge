require 'take_away'
describe TakeAway do

  subject(:takeaway) { described_class.new }
  let(:dish) { double(:dish) }
  let(:dish_name) { double(:dish_name) }
  describe 'A TakeAway' do
    it "knows it's dishes" do
      expect(takeaway.dish['fried chicken']).to(be_a Float)
    end

    it "can list dishes with prices" do
      expect(takeaway).to respond_to(:list)
      expect(takeaway.list).to be_truthy
    end
    
    before { allow(takeaway).to receive(:select_dishes).with(any_args) }
    it "selects several dishes available" do
      expect(takeaway).to respond_to(:select_dishes).with_unlimited_arguments
    end

  end

end
