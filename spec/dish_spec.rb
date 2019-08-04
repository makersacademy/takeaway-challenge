require 'dish'

describe Dish do
  subject { described_class.new("burger", 15) }
  it { is_expected.to respond_to(:name, :price) }
end
