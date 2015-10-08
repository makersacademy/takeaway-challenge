require 'spec_helper'
require './lib/takeaway'

describe Takeaway do

  let(:dish) { double :dish, see: 'Dish output', number: '',
    quantity: ''}
  let(:meal) { double :meal, add: '', total: 10.00 }

  before(:each) { allow(dish).to receive(:new).and_return(dish) }
  before(:each) { allow(meal).to receive(:new).and_return(meal) }

  subject { Takeaway.new(dish) }

  it 'returns a properly formatted list of dishes available when asked' do
    expect(subject.see).to eq 'Dish output, Dish output, Dish output, Dish output'
  end

  it 'accepts an order and populates a menu' do
    expect(subject.order([[44, 2]], 10.00, meal)).to eq true
  end

end