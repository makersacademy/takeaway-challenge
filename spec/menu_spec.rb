require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  let(:dishes) { Takeaway.new.dishes }
  let(:list) { ["marinara - £5", "margherita - £6", "napoli - £6", "calzone - £8"] }
  it 'has a method that takes in a hash of dishes and print them as a menu' do
    expect(menu.show_menu(dishes)).to eq(list)
  end
end
