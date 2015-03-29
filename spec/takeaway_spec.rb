require 'takeaway.rb'

describe Takeaway do

  it 'menu is a hash' do
    expect(subject.menu).to be_a Hash
  end

  it 'has a list of dishes and prices' do
    expect(subject.menu).to include("baked eggs" => 7.75)
  end

  it 'can press order' do
    subject.place_order
    expect(subject.order).to be_an Array
  end
end
