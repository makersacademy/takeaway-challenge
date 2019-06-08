require 'menu'

describe Menu do
  it 'should display the names of dishes' do
    dish1 = double("dish")
    allow(dish1).to receive(:description) { "chicken" }
    list = [dish1, dish1]
    menu = Menu.new(list)
    expect(menu.list).to eql("chicken, chicken")
  end
end
