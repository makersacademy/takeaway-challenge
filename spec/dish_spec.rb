require './lib/dish.rb'

describe Dish do

  it { is_expected.to be_an_instance_of Dish }

  it { is_expected.to respond_to(:to_s) }

end