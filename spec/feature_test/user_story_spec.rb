# to do:
# all the whatsapps
# buy marmot
# learn rahul's markdown user story software
# get better at pry

require 'menu'
require 'order'

describe 'user stories' do

  # user story 1
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "checks the user can see a list of dishes with prices" do
    menu = Menu.new
    expect(STDOUT).to receive(:puts)
    menu.view
  end

end

menu = Menu.new
menu.view
