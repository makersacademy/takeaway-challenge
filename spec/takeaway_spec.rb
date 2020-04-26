#As a customer
#So that I can check if I want to order something
#I would like to see a list of dishes with prices
require 'takeaway'
require 'menu'
describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

let(:menu) { double(:menu, print: printed_menu) }
let(:printed_menu) { "burger = £3.50" }

it 'shows a menu with a list of dishes and prices' do
  expect(subject.print_menu).to eq("burger = £3.50")
end
end
