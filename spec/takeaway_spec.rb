require 'takeaway.rb'
require 'menu.rb'
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices


describe Takeaway do

  subject(:takeaway) { Takeaway.new }



  it 'responds to #show_menu' do
    expect(takeaway).to respond_to(:show_menu)
  end

  xit '#show_menu displays dishes and prices)' do
    expect(takeaway.show_menu).to eq(:menu)
  end
end
