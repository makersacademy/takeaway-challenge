require 'takeaway'

describe Takeaway do
  let(:takeaway) { Takeaway.new }

  it 'nothing in basket' do
    expect(takeaway.order).to eq nil
  end

  it 'has items on the menu' do
    expect(takeaway.food).to eq food
  end
end