require './lib/menu.rb'

describe Menu do
  it { is_expected.to be_instance_of(described_class) }

  it { is_expected.to respond_to(:menu_items) }
end
