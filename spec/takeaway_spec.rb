require './lib/takeaway.rb'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu: menu)}

  let(:menu) { double(:menu, print: print_menu) }
  let(:print_menu) {'Steak frites: £10'}

  it "shows a list of dishes and prices" do
    expect(takeaway.print_menu).to eq(print_menu)
  end
end