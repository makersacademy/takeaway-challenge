require 'menu'

describe Menu do
  let(:dish) { { dish: "Pad Thai", price: 5 } }

  it 'shows the dishes' do
    expect(subject.list_of_dishes).to include(dish)
  end
end