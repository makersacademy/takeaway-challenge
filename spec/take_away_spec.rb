require './lib/take_away'
describe TakeAway do
  let(:menu) { double :menu }
  subject(:takeaway) { described_class.new(menu) }
  describe "#initialize" do
    it 'creates an empty list of orders' do
      expect(takeaway.order_list).to eq []
    end
    it 'creates a menu' do
      expect(takeaway.menu).to eq menu
    end
  end
end
