require './lib/takeaway.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, printing: printed_m) }
  let(:printed_m) { "Pizza: £10.99, Sandwich: £2.99" }

  it 'has the dishes and prices' do
    expect(takeaway.print_m).to eq(printed_m)
  end

  it 'shows the dishes with prices' do
    printed_m = "Pizza: £10.99, Sandwich: £2.99"
    expect(menu.printing).to eq(printed_m)
  end

end
