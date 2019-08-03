require 'dish'

describe Dish do
  it { is_expected.to respond_to(:name, :price) }
end