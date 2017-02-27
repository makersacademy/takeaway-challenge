require 'takeaway'

describe Takeaway do
subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms) }

let (:menu) { double(:menu, print: printed_menu) }
let(:order) { double(:order, total: 9.70) }
let(:sms) { double(:sms, deliver: nil) }
let(:printed_menu) { "Edamame: £2.45" }

let(:dishes) { { edamame: 2, vegetable_spring_roll: 1 } }

before do
allow(order).to receive(:add)
end

it 'menu shows a list of dishes with their prices' do
  expect(takeaway.print_menu).to eq(printed_menu)
end

it 'can order some number of several available dishes' do
  allow(order).to receive(:add).twice
  takeaway.make_order(dishes)
end

it 'knows the order total' do
 total = takeaway.make_order(dishes)
 expect(total).to eq(9.70)
end

it "sends an SMS when the order has been placed " do
  expect(sms).to receive(:deliver)
  takeaway.make_order(dishes)
end
end
