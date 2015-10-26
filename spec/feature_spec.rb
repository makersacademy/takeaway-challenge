require 'takeaway'
require 'menu'
require 'menu_loader'
require 'order'
require 'order_total'
require 'notifier'
require 'config_loader'
require 'delivery_estimator'

describe 'Takeaway App' do
  let(:now) {Time.new(2015, 10, 25, 0, 0, 0, "+00:00") }
  subject(:takeaway) do
    Takeaway.new(menu_klass: Menu,
                 menu_loader_klass: MenuLoader,
                 order_klass: Order,
                 notifier_klass: Notifier,
                 config_loader_klass: ConfigLoader,
                 delivery_estimator_klass: DeliveryEstimator,
                 order_total_klass: OrderTotal)
  end

  context 'see a list of dishes with prices' do
    it 'shows a list of dishes and prices' do
      expect(takeaway.print_menu).to eq(
        "Cheeseburger\t4.99\nPizza\t7.99\nKebab\t2.99\n")
    end
  end

  context 'select some number of several available dishes' do
    it 'allows selection of several dishes' do
      burger = takeaway.pick_item('Cheeseburger')
      expect(takeaway.add_to_order( burger, 1)).to eq 1
    end
  end

  context 'check the total' do
    it 'total matches the estimate by the customer' do
      burger = takeaway.pick_item('Cheeseburger')
      takeaway.add_to_order(burger, 1)
      pizza = takeaway.pick_item('Pizza')
      takeaway.add_to_order(pizza, 2)
      kebab = takeaway.pick_item('Kebab')
      takeaway.add_to_order(kebab, 1)
      expect(takeaway.verify_total(23.96)).to be true
    end
  end

  context 'notify customer of successful order' do
    it 'notifies customer with suitable message' do
      allow(Time).to receive(:now).and_return now
      expect(takeaway.notify).to eq(
        "Thank you! Your order was placed and will be delivered before 01:00")
    end
  end
end
