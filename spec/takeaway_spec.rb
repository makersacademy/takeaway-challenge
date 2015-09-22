require 'spec_helper'
require_relative '../lib/takeaway.rb'

describe Takeaway do

  subject { Takeaway.new(Dish) }

  it 'returns a properly formatted list of dishes available when asked' do
    expect(subject.see).to eq '44 : Duck a la banana : £4.50, 10 : Deep '\
    'fried Mars bar : £0.10, 20 : Birdseye potato waffles : £1.99, 69 : Trio!'\
    ' Trio. : £1.50'
  end

  it 'accepts an order and populates a menu' do
    expect(subject.order([[44, 2], [20, 1]], 10.99, Meal)).to eq true
  end

end