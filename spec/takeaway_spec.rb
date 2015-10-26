require 'takeaway'

describe Takeaway do
  let(:burger_description) {"Cheeseburger"}
  let(:burger_price) {4.99}
  let(:burger_to_s) {"#{burger_description}\t#{burger_price}"}
  let(:burger) do
    double :dish,
      description:  burger_description,
      price: burger_price,
      to_s: burger_to_s
  end
  let(:kebab_description) {"Kebab"}
  let(:kebab_price) {3.00}
  let(:kebab_to_s) {"#{kebab_description}\t#{kebab_price}"}
  let(:kebab) do
    double :dish,
      description: kebab_description,
      price: kebab_price,
      to_s: kebab_to_s
  end
  let(:order_lines) {{burger =>  1, kebab =>  1}}
  let(:menu) {double :menu, to_s: "#{burger_to_s}\n#{kebab_to_s}\n"}
  let(:menu_klass) {double :menu_klass, new: menu}
  let(:total) {burger_price + kebab_price}
  let(:order) {double :order, total: total}
  let(:order_klass) {double :order_klass, new: order}
  let(:delivery_estimator) {double :delivery_estimator, eta: true}
  let(:delivery_estimator_klass) do
    double :delivery_estimator_klass,
     new: delivery_estimator
  end
  let(:notifier) {double :notifier, notify: true}
  let(:notifier_klass) {double :notifier_klass, new: notifier}
  let(:menu_loader) {double :menu_loader}
  let(:menu_loader_klass) {double :menu_loader_klass, new: menu_loader}
  let(:config_loader) {double :config_loader}
  let(:config_loader_klass) do
    double :config_loader_klass,
      new: config_loader
  end
  let(:order_total) {double :order_total}
  let(:order_total_klass) do
    double :order_total_klass,
      new: order_total
  end
  subject(:takeaway) do
    described_class.new(menu_klass: menu_klass,
                        menu_loader_klass: menu_loader_klass,
                        order_klass: order_klass,
                        order_total_klass: order_total_klass,
                        notifier_klass: notifier_klass,
                        config_loader_klass: config_loader_klass,
                        delivery_estimator_klass: delivery_estimator_klass)
  end

  context 'Print Menu' do

    it {is_expected.to respond_to(:print_menu)}

    it 'prints the menu' do
      expect(takeaway.print_menu).to eq "#{burger_to_s}\n#{kebab_to_s}\n"
    end
  end

  context 'Picking an item from the menu' do
    it {is_expected.to respond_to(:pick_item).with(1).argument}

    it 'allows a customer to pick an item from the menu' do
      allow(menu).to receive(:choose).with(burger_description).and_return(burger)
      expect(takeaway.pick_item(burger_description)).to eq burger
    end
  end

  context 'Verify the total of order' do
    it {is_expected.to respond_to(:verify_total).with(1).argument}

    it 'Verifies the total of the order' do
      expect(takeaway.verify_total(total)).to be true
    end
  end

  context 'Adding an item to an order' do
    it {is_expected.to respond_to(:add_to_order).with(2).argument}
    it 'Adds an items to an order' do
      allow(order).to receive(:add).with(kebab, 1).and_return(kebab)
      takeaway.add_to_order(kebab, 1)
      allow(order).to receive(:add).with(burger, 1).and_return(burger)
      expect(takeaway.add_to_order(burger, 1)).to eq burger
    end
  end

  context 'Notifying Customers' do
    it {is_expected.to respond_to(:notify)}

    it 'calls upon the notifier to do the notification' do
      expect(notifier).to receive(:notify)
      takeaway.notify
    end

    it 'calls upon the delivery estimator to estimate delivery time' do
      expect(delivery_estimator).to receive(:eta)
      takeaway.notify
    end
  end
end
