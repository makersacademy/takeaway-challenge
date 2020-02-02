require 'take_away'

describe TakeAway do
    subject(:takeAway) { described_class.new(menu: menu) }
    #adding double:
    let(:menu) {double(:menu, print: printed_menu)}
    let(:printed_menu) {'Sausage: £5'}

    it "Shows the menu with list of dishes and prices" do
    expect(takeAway.print_menu).to eq(printed_menu)
    end
end
