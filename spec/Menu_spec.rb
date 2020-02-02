require 'menu'
require 'dishes'

describe Menu do

  before(:each) do
    Dishes = double(Dishes, :price => 10)
    subject.menu_add(Dishes)
  end

  it 'Menu.menu should return an array' do
    expect(subject.menu).to be_instance_of(Array)
  end

  it 'Menu.menu should contain Dishes' do
    expect(subject.menu).to include(Dishes)
  end

  it 'Menu.menu should return dish list with prices' do
    expect{subject.menu}.to output(/Dishes.*£#{Dishes.price}/).to_stdout
  end
end
