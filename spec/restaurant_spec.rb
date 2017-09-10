require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new("Busaba Eathai", "Chelsea", menu: menu, notifier: notifier) }

  let(:menu) { instance_double("Menu") }
  let(:order) { instance_double("Order") }
  let(:notifier) { instance_double("Notifier") }

  it { is_expected.to respond_to(:menu) }
  it { is_expected.to respond_to(:accept_customer_order) }
  it { is_expected.to respond_to(:create_customer_order) }
  it { is_expected.to respond_to(:cancel_customer_order) }

end
