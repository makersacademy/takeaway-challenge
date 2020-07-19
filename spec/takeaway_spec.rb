require 'takeaway'
describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu){double(:menu, print: printed_menu)}
  let(:printed_menu) {"Avocado salad: £4.50"}

    it 'shows the menu with dishes and prices' do
      expect(takeaway.printed_menu).to  eq(printed_menu)
    end
end
