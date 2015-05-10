require 'menu'

describe Menu do

  it 'has six items in the menu' do
    expect(subject.dishes.length).to be 6
  end
end