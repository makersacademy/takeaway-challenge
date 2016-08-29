require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it '#show_list should display list' do
    expect{menu.show_list}.to output.to_stdout
  end
  context '#price function' do
    it 'show price of a specified menu item' do
      expect(menu.price("Pepperoni")).to eq 9
    end
    it 'raise error if item selected is not on the menu' do
      expect{menu.price("test")}.to raise_error("Not on the menu")
    end
  end
end
