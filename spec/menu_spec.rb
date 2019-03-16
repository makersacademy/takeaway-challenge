require 'menu'

describe Menu do
  let(:dish) { double :dish }

  it "should set @dishes to an emptyh array when initialized" do
    menu = Menu.new
    expect(menu.dishes).to eq []
  end

  it "should push a dish object to the @dishes array when add_dish is called" do
    menu = Menu.new
    menu.add_dish(dish)
    expect(menu.dishes).to eq [dish]
  end

  it "should be able to hold multiple dish object in the @dishes array" do
    menu = Menu.new
    2.times { menu.add_dish(dish) }
    expect(menu.dishes).to eq [dish, dish]
  end
end
