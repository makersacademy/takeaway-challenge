require 'takeaway'

describe Takeaway do
    subject(:takeaway) { described_class.new(menu: menu) }

    let(:menu) { double(:menu, print: printed_menu) }
    let(:printed_menu) { "Menu Items List" }

    it 'shows the menu with a list of dishes and prices' do
        expect(subject.print_menu).to eq(printed_menu)
    end 
end 