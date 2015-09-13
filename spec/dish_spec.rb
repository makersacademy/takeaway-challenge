require_relative 'spec_helper.rb'
require_relative '../lib/dish.rb'

describe Dish do

  let (:duck){ Dish.new('Duck a la banana', 4.50, 2) }

  it 'should take three arguments when initialised' do
    expect(Dish).to respond_to(:new).with(3).argument
  end

  it 'knows its description' do
    expect(duck.description).to eq 'Duck a la banana'
  end

  it 'knows its price' do
    expect(duck.price).to eq 4.50
  end

  it 'knows its quantity' do
    expect(duck.quantity).to eq 2
  end

  it 'returns a properly formatted string for (spits it like it knows it)' do
    expect(duck.see). to eq 'Duck a la banana : £4.50 : 2'
  end

end