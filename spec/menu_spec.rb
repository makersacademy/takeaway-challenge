require 'menu'

describe Menu do
  it 'should hold an array of dishes' do
    dish = { name: "chicken", price: 20}
    expect(subject.add_dish(dish)).to eq [dish]
  end
end
