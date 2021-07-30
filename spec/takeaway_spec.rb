require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { Takeaway::MENU }

  it 'shows the user a menu when asked' do
    expect(takeaway.read_menu).to eq menu
  end

  it { is_expected.to respond_to(:select).with(1).argument }

  it 'adds selected dish to the order' do
    selected = [{ "bread" => 5 }]
    expect(takeaway.select("bread")).to eq selected
  end

  it 'totals the items in the order' do
    5.times { takeaway.select("bread") }
    expect(takeaway.total).to eq 25
  end

  it 'allows user to check total matches order' do
    3.times { takeaway.select("bread") }
    expect(takeaway.check_total).to eq 'Your order was [{"bread"=>5}, {"bread"=>5}, {"bread"=>5}]. Your total was 15.'
  end

end
