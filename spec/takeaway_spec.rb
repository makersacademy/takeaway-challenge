require 'takeaway'
require 'menu'
describe Takeaway do
subject(:takeaway) {described_class.new(menu=Menu.new)}
let(:menu) {double(:menu)}


it 'print the menu ' do
  expect(takeaway.print_menu).to eq(Menu.new.print)
end



end