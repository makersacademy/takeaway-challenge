require "takeaway"

describe Takeaway do
subject(:takeaway) { described_class.new(menu: menu, order: order) }

let (:menu) { double(:menu, print: printed_menu) }
let(:order) { double(:order) }
let(:printed_menu) { "Edamame: £2.45" }

let(:dishes) {{ edamame: 2, vegetable_spring_roll: 1 }}

it 'menu shows a list of dishes with their prices' do
  expect(takeaway.print_menu).to eq(printed_menu)
end

it 'can order some number of several available dishes' do
  allow(order).to receive(:add).twice
  takeaway.make_order(dishes)
  # expect(takeaway.make_order(dishes)).to eq("Your order is for £9.70")
end
end
