require './lib/Meals'

describe Meals do
  subject(:meals) { Meals.new }

  it { is_expected.to be_instance_of(Meals) }
end
