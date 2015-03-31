require 'capybara/rspec'
require 'dish'
require 'menu'

feature 'When a new menu is created' do
  let(:menu) { Menu.new }

  before do
    allow(menu).to receive(:print)
    allow($stdout).to receive(:puts)
  end

  scenario 'has to be empty' do
    expect(menu.list).to be_empty
  end

  scenario 'can add dishes' do
    menu.add Dish.new :carbonara, 4.80
    menu.add Dish.new :amatriciana, 4.40
    expect(menu.list.length).to eq 2
  end

  scenario 'can remove dishes' do
    menu.add Dish.new :carbonara, 4.80
    menu.add Dish.new :amatriciana, 4.40
    menu.remove :amatriciana
    expect(menu.list.length).to eq 1
  end

  scenario 'can add dishses and display them' do
    menu.add Dish.new :carbonara, 4.80
    expect(menu.list).to eq(carbonara: 4.80)
  end

end