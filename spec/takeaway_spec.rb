require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, display: list) }
  let(:list) { "Kebab: £10, Chips: £2" }

  it 'should store a list of dishes' do
    expect(takeaway.show_menu).to eq(list)
  end
end
