require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { Takeaway::MENU }

  it 'shows the user a menu when asked' do
    expect(takeaway.read_menu).to eq menu
  end

  it {is_expected.to respond_to(:select).with(1).argument}

  it 'adds selected dish to the order' do
    bread = bread
    selected = [{"bread" => 5}]
    expect(takeaway.select("bread")).to eq selected
  end

end
