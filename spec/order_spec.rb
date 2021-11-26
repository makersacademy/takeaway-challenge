require 'order'

describe Order do 
  it 'has an empty order basket' do 
    expect(subject.basket).to be_empty
  end
end