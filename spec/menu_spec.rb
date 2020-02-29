require 'menu'

describe Menu do

  it 'prints a list with the whole menu and prices' do
    expect(subject.print_menu).to include("Cheese Burger" => 5)
  end

end
