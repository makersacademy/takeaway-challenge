require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:menu) {double :menu}
  describe '#menu' do

    it { is_expected.to respond_to(:read_menu) }
  
    it "shows a list of dishes with prices" do
        expect(takeaway.read_menu).to eq("Rice: £3.00")
    end
  end
end

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
