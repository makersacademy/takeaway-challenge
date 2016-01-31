require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { 'menu'}

  it 'displays menu, lists out dishes and their prices' do
    expect(takeaway.print_menu).to eq (printed_menu)
  end
end
