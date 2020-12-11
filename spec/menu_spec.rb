require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  it 'creates an instance of the Menu class' do
    expect(menu).to be_instance_of(Menu)
  end

  it 'has a default list of dishes' do
    expect(menu.dishes).to eq Menu::DISHES
  end

  describe ".display method" do
    it 'shows the contents of the menu' do
      expect(menu.display).to satisfy { |k, v| "#{k}: £#{v}" }
    end

  end
end
