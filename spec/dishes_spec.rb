require 'dishes'

describe Dishes do

  it 'is an instance of Dishes' do
    expect(subject).to be_a Module
  end

  it 'has a method add_dish, with 2 arguments' do
    expect(subject).to respond_to(:add_dish).with(2).arguments
  end

  it 'add_dish adds a dish to menu as a hash' do
      subject.add_dish("pasta", 8)
      expect(subject.menu).to eq [{:dish => "pasta", :price => 8}]
  end


end