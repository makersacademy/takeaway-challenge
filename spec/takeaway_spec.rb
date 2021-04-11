require "takeaway"

describe Takeaway do
    subject(:takeaway) { described_class.new(menu: menu) }

    let(:menu) { double(:menu, print: menu_output) }
    let(:menu_output) { "Meal: Price" }

    context 'menu' do
        it 'shows the menu including dishes and prices' do
        expect(takeaway.provide_menu).to eq(menu_output)
        end
    end
end