require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, message: message) }

  let(:menu) { double(:menu, show: printed_menu) }
  let(:printed_menu) {'Classic Fondue : £13.0'}
  let(:order) { instance_double('Order', total: 13.0) }
  let(:message) { instance_double('Message') }
  let(:dish) { {'Classic Fondue': 2,'Special Fondue': 1} }

it 'shows the menu with dishes and corresponding prices' do
  expect(takeaway.show).to eq(printed_menu)
end


end
