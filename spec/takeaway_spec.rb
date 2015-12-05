require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) {double('menu', :dishes => { salad: 12 }) }
  let(:dish) {double :dish}
  let(:dish2) {double :dish2}

  it { is_expected.to respond_to(:select).with(2).arguments }

  it 'selects items from the menu which is stored as an order' do
    expect(takeaway.select(:salad, 2)).to eq "You have added 2 salad(s) to your basket"
  end

  it 'returns the the items that have been ordered' do
    takeaway.select(:dish, 2)
    takeaway.select(:dish2, 3)
    expect(takeaway.number_of_dishes).to eq 5
  end

  it 'returns the sum of the cost of each item ordered' do
    takeaway.select(:dish, 2)
    takeaway.select(:dish2, 1)
    expect(takeaway.total_price).to eq 38
  end

end
