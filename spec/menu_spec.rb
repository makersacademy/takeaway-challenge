require "menu"

describe Menu do
  subject(:menu) {described_class.new}

  it 'menu responds to view menu' do
    expect(menu).to respond_to(:view_menu)
  end

  it 'menu contains items' do
    subject.menu.each do |option, price|
      expect(menu.view_menu).to include(pizza: 8)
    end
  end

end
