require 'menu'

describe Menu do

  it 'has a list of dishes' do
    items = { "Tea" => 1.5, "Coffee" => 2.5 }
    menu = Menu.new(items)
    expect(menu.items).to eq("Tea" => 1.5, "Coffee" => 2.5)
  end

end
