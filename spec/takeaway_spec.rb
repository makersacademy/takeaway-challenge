require 'takeaway'

describe Takeaway do
  subject { described_class.new }

  it 'should respond to see_menu method' do
    expect(subject).to respond_to(:see_menu)
  end

  it 'should respond to place_order method' do
    expect(subject).to respond_to(:place_order).with(2).arguments
  end

  it 'should respond to order method' do
    expect(subject).to respond_to(:order)
  end
end
