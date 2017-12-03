require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double(:dish1) }

  it 'gives access to a list of dishes' do
    expect(menu.show_menu.is_a? Array).to be true
  end

  it 'dishes can be added to the list' do
    menu.add_dish(dish)
    expect(menu.show_menu.include? dish).to be true
  end
end
