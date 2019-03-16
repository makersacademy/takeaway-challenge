require 'dish'

describe Dish do
  subject(:dish) { described_class.new }
  it { is_expected.to respond_to :price }
end