require 'order'
require 'menu'

describe Order do

  let(:menu) { double(:menu, 'Hamburger' => 250) }

  it 'shows a menu' do
    expect(subject.list).to be_a(Hash)
  end

  it { is_expected.to respond_to(:select_item) }

  it { is_expected.to respond_to(:total_cost) }

end
