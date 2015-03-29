require 'capybara/rspec'
require 'takeaway'

feature 'custumer see the menu with prices' do
  let(:takeaway) { Takeaway.new }
  scenario 'we have a menu' do
    expect(takeaway.menu).to be_a Hash
  end
  scenario 'menu has a list of dishes and prices' do
    expect(takeaway.menu).to include("baked eggs" => 7.75)
  end
  scenario 'order a dish' do
    allow(takeaway).to receive(:place_order) { [1, 2] }
    expect(takeaway.order).to be_an Array
  end
  scenario 'return list of order and total' do
    allow(takeaway).to receive(:place_order) { [1, 2] }
    expect(takeaway.dishes_list).to include('beans and toast', 'baked eggs')
    expect(takeaway.total).to eq 13.75
  end
end
