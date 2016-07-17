require 'order'

describe Order do

  let(:menu) { double(:menu, 'Small Chips' => 150) }

  it 'shows a menu' do
    expect(subject.list).to be_a(Hash)
  end

  it { is_expected.to respond_to(:selection) }

  it { is_expected.to respond_to(:total_cost) }

  # context 'ordering' do
  #   item = 'Hamburger'
  #   qty = 12
  #
  #end

end
