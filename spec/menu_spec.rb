require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  let(:dishes) { Takeaway.new.dishes }
  let(:list) { ["marinara - £5", "margherita - £6", "napoli - £6", "calzone - £8"] }
  it 'creates a hash with a list of dishes' do
    expect(menu.instance_variable_get(:@dishes)).to eq({ "marinara" => 5, "margherita" => 6, "napoli" => 6, "calzone" => 8 })
  end

  it 'has a method that takes in a hash of dishes and print them as a menu' do
    expect(menu.show_menu).to eq(list)
  end

  it 'has a method that establish if a dish is in the menu' do
    expect(menu.in_menu?("fish")).to be(false)
    expect(menu.in_menu?("calzone")).to be(true)
  end

end
