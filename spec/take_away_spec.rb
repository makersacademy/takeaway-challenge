require 'take_away'
describe TakeAway do

  subject(:takeaway) { described_class.new }
  let(:dish) { double :dish}
  let(:list) {
    [
      { "fried chicken" => 7.00 },
      { "plain rice" => 2.00 },
      { "steamed vegetables" => 4.50 },
      { "cheese cake" => 3.50 }
    ]
  }

  describe 'A TakeAway' do
    it "can list dishes with prices" do
      expect(takeaway).to respond_to(:list)
      expect(takeaway.list).to eq list
    end

    it "selects dishes" do
      expect(takeaway.select_dishes("fried chicken", 2)).to eq dish
    end
    context 'dish not available' do
      it "raises an error" do
        expect { takeaway.select_dishes("chicken", 2) }.to raise_error("Selected dish not available")
      end
    end

  end

end
