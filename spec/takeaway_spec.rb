require 'takeaway'

describe Takeaway do
  let(:restaurant) { 'chicken shop' }
  let(:takeaway) { Takeaway.new(menu, order) }
  let(:menu) { double :menu, view_dishes: { "1 piece chicken meal" => 4.49 } }
  let(:order) { double :order, add_to_order: '1 piece chicken meal' }

  describe '#view_menu' do

    it 'shows the customer a list of dishes with prices' do
      expect(menu).to receive(:view_dishes)
      takeaway.view_menu(restaurant)
    end
  end

  describe '#order' do

    it 'adds an order to a basket' do
      expect(order).to receive(:add_to_order)
      takeaway.order('1 piece chicken meal')
    end
  end
end
