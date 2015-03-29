require 'capybara/rspec'

feature 'items can be added to the menu' do
  let(:menu) { Menu.new }
  scenario 'as a yaml file' do
    yaml_file = './menu.yml'
    menu.load(yaml_file)
    expect(menu.items).not_to be_empty
  end
end