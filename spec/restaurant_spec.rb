require 'restaurant.rb'

describe Restaurant do

  it 'has a name' do

  end

  it 'has a list of dishes' do
    expect(subject.list_of_dishes).to be_a(Hash)
  end


  end
