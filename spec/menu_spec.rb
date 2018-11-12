require 'menu'

describe Menu do

  it 'has a list of dishes with prices' do
    restaurant = 'chicken shop'
    expect(subject.view_dishes(restaurant)).not_to be_empty
  end
end
