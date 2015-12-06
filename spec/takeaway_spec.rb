require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu_klass = menu) }
  let(:menu) {double('menu', :dishes => { "salad" => 12 }) }
  let(:dish) {double :dish }
  let(:dish2) {double :dish2}
  let(:order) {double :order}

  it { is_expected.to respond_to(:select).with(2).arguments }

  context 'When selecting food items frome the menu' do

    it 'selects items from the menu which is stored as an order' do
      expect(takeaway.select("salad")).to eq "You have added 1 salad(s) to your basket"
    end

    it 'returns the the items that have been ordered' do
      takeaway.select("salad", 2)
      takeaway.select("salad", 3)
      expect(takeaway.number_of_dishes).to eq 5
    end

    it 'returns the sum of the cost of each item ordered' do
      5.times{takeaway.select("salad")}
        takeaway.total_dishes_ordered
        expect(takeaway.total_price).to eq 60

    end
  end

  context "When verifying the order" do
    # before do
    #   allow(order).to recieve(:total_price) {12}
    # end

    it 'rasies an error if something not on the menu is ordered' do
      expect{takeaway.select("Hot Dog")}.to raise_error "Sorry we don't have Hot Dog on the menu"
    end

    # it 'raises an error if the order is not correct' do
    #   expect(order)
    # end
  end
end
