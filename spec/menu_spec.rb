require 'menu.rb'

describe do

  it 'should have a list_of_dishes variable' do
    menu = Menu.new
    expect(menu.list_of_dishes).to(eq([]))
  end
end
