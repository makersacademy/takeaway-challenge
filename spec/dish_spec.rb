require 'spec_helper'
require './lib/dish'

describe Dish do

  let (:duck){ Dish.new(44, 'Duck a la banana', 4.50, 2) }

  it 'should take three arguments when initialised' do
    expect(Dish).to respond_to(:new).with(4).argument
  end

  it 'knows its number' do
    expect(duck.number).to eq 44
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
    expect(duck.see).to eq '44 : Duck a la banana : £4.50'
  end

  it 'returns the total price of the dish' do
    expect(duck.total).to eq 9.00
  end

end