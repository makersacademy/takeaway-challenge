require 'restaurant'

describe 'Restaurant' do
  it "can show a menu" do
    restaurant = Restaurant.new
    menu = Menu.new
    expect { restaurant.see_menu }.to output { menu.print_menu }.to_stdout
  end
end
