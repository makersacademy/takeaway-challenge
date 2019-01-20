require 'order'

RSpec.describe Order do

  it 'can add a dish to basket' do
    dish = double("pizza")
    expect(subject.order("pizza")).to eq([:pizza, 5])
  end

  end
