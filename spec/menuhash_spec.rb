require './lib/menuhash'

describe Foodbuddy do

  #double allow to receive return from hash

  it "stores dishes with their prices in a hash" do
    expect(subject.list.fetch("Greek-style roast fish")).to eq(4.59.round(2))
  end
  end
