require 'menu'

describe Menu do

  it 'shows the price of the food' do
    expect(subject.price("spring roll")).to eq(subject.dishes["spring roll"])
  end

end