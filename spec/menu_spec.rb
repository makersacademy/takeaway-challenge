require 'menu'

describe Menu do

  DEFAULT_MENU = { "chicken tikka": 9, "beef madras": 10, "vegetable vindaloo": 8 }

  it 'contains a default list of dishes' do
    expect(subject.instance_variable_get(:@list_of_dishes)).to eq(DEFAULT_MENU)
  end

  it 'can disply a list of dishes' do
    menu = Menu.new
    expect { menu.show_menu }.to output.to_stdout
  end

end
