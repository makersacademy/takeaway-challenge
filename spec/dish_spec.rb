require 'dish'

describe Dish do
  subject { Dish.new("Test Dish", 10) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:price) }
end
