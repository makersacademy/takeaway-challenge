require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, list: list_menu) }
  let(:list_menu) { 'German Doner Kebab: £10.50' }

  it 'allows to show a menu' do
    expect(takeaway.show).to eq(list_menu)
  end
end
