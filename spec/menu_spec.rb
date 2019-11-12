require './lib/menu.rb'

describe Menu do

  it 'should create an instance of the menu class' do
    menu = Menu.new
    expect(menu).to be_an_instance_of(Menu)
  end

  it 'should create the menu when initialized' do
    menu = Menu.new
    expect(menu.menus).to include("Edemame" => 2)
  end

  it 'should display the menu correctly when asked to do so' do
    menu = Menu.new
    expect { menu.display_menu }.to output("vegetable curry : £12\nCalifornia Roll : £4\nEdemame : £2
Burrata : £6\nTricolore Salad : £10").to_stdout
  end
  end
