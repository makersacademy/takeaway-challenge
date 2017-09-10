require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new("Busaba Eathai", "Chelsea", menu: menu, notifier: notifier) }

  let(:menu) { instance_double("Menu") }
  let(:notifier) { instance_double("Notifier") }

  it { is_expected.to respond_to(:menu) }

end
