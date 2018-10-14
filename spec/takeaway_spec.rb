

require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) {double:menu, display:'Chicken Tikka: 5.25, Lamb Biryani: 9.50' }
  let(:order) { double(:order, total_cost: 14.75) }
  let(:meals) { {'Chicken Tikka' => 2, 'Lamb Biryani' => 1} }

  describe '#view_menu' do
    it 'shows list of dishes with prices' do
      expect(takeaway.view_menu).to eq menu.display
    end
  end

  describe '#order_request' do
    it 'makes an order for a number of meals' do
      allow(order).to receive(:add)
      takeaway.order_request(meals)
    end
end

it 'calculates the total cost of the order' do
  allow(order).to receive(:add)
  expect(takeaway.order_request(meals)).to eq(14.75)
end
end
