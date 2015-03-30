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

  it 'return list of order' do
    allow(subject).to receive(:place_order) { [1, 2] }
    expect(subject.dishes_list).to include('beans and toast', 'baked eggs')
  end

  it 'return total' do
    allow(subject).to receive(:place_order) { [1, 2] }
    expect(subject.total).to eq 13.75
  end
end
