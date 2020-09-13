require 'Takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu: menu) } # inject menu to takeaway as print menu shouldn't be responsibility of takeaway class
  let(:menu) { double(:menu, print: printed_menu) } # create double of menu to access menu from takeaway class, has method print in its Class, injected here to the takeaway class
  let(:printed_menu) { "Coffee: 0.99" }

  it 'prints the list of dishes with prices' do #print_menu inside takeaway class, now we start mit Menu zu fummeln
    expect(takeaway.print_menu).to eq(printed_menu)
  end
end