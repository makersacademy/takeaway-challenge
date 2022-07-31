require 'takeaway'
describe Takeaway do
  subject(:takeaway){described_class.new(menu: menu)}
  let(:menu) { double(:menu, print: printed_menu)}
  let(:printed_menu){ "fish: £2.50" }
 it "display the menu with the dish and prices" do
  expect(takeaway.print_menu).to eq(printed_menu)
 end
end
