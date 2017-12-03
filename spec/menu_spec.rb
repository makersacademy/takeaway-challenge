require 'menu'
require 'order'

describe Menu do
  let (:menu) { Menu.new }

  it 'should print out all the dishes in the menu' do
    expect(menu.print_dishes).to be_instance_of(Array)
  end

end
