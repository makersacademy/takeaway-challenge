require 'dish'

describe Dish do
  subject { described_class.new("Baked Potato", 3.25) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:price) }

end
