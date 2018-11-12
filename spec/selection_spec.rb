
require 'select'
require 'menu'

describe Select do

  subject(:my_selection) { described_class.new }

  it 'lets the customer select from the menu' do
    my_menu = Menu.new
    my_lunch = []
    my_options = my_menu.display
    # expect(my_menu.display.select).to respond_to{ |key, _| food_selected.include? key }
    my_options.each do |key, value|
      if key.to_i < 6
        my_lunch.push(value)
      end
    end
  end
end
