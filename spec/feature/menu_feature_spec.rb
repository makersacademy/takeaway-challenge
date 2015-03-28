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

  scenario 'can add dishses and display them' do
    menu.add Dish.new :carbonara, 4.80
    menu.add Dish.new :amatriciana, 4.40
    menu.add Dish.new :pesto, 4.50
    expect(menu.display).to eq menu.list
  end
end