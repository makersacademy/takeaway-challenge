require 'dish.rb'

describe Dish do

  let(:subject) { Dish.new(:fish, 7) }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :price }

end
