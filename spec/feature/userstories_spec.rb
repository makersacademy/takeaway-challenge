require 'takeaway'

RSpec.describe 'user stories' do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'shows the list of dishes' do
    takeaway = Takeaway.new
    expect { takeaway.show_menu }.not_to raise_error
    expect(takeaway.show_menu).to eq Takeaway::MENU
  end
end