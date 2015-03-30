require 'capybara/rspec'
require 'takeaway'

feature 'displaying menu' do
  scenario 'someone wishes to display the full menu' do
    takeaway = Takeaway.new
    menu = takeaway.menu
    expect(menu).to eq menu
  end
end
