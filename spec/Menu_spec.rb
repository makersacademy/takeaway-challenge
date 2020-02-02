require 'menu'
require 'dishes'

describe Menu do

  it 'Menu.menu should return an array' do
    expect(subject.menu).to be_instance_of(Array)
  end

  it 'Menu.menu should contain Dishes' do
    Dishes = class_double(Dishes)
    subject.menu_add(Dishes)
    expect(subject.menu).to include(Dishes)
  end

end
