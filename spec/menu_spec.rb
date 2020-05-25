require 'menu'

describe Menu do

  DEFAULT_MENU = { "chicken tikka": 9, "beef madras": 10, "vegetable vindaloo": 8 }

  it 'contains a default list of dishes' do
    expect(subject.instance_variable_get(:@list_of_dishes)).to eq(DEFAULT_MENU)
  end

  it 'can disply a list of dishes' do
    menu = Menu.new
    expect { menu.print_menu }.to output.to_stdout
  end

  it 'checks if item is on menu' do
    dish = "chicken tikka"
    expect(subject.on_menu?(dish.to_sym)).to eq(true)
  end

end
