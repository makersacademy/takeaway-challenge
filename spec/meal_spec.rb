require 'spec_helper'
require_relative '../lib/meal.rb'

describe Meal do

  let (:duck_dish){ double(:dish, see: "44 : Duck a la banana : £4.50 : 2",
    total: 9.00) }
  let (:deep_dish){ double(:dish, see: "10 : Deep fried Mars bar : £0.10 : 10",
    total: 1.00) }

  it 'returns the total price of the order' do
    subject.add(duck_dish)
    subject.add(deep_dish)
    expect(subject.total).to eq 10.00
  end

end