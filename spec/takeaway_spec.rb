require 'takeaway'

describe Takeaway do

  it 'should have a function to view the menu' do
    takeaway = Takeaway.new
    expect(takeaway).to respond_to(:menu)
  end

  it 'should show you the menu when you call the function' do
    takeaway = Takeaway.new
    expect(takeaway.menu).to be_an_instance_of(Hash)
  end

  it 'should list a number of items and prices' do
    takeaway = Takeaway.new
    expect(takeaway.menu).not_to be_empty
  end

  it 'should show a number of items' do
    takeaway = Takeaway.new
    expect(takeaway.menu.length).to be > 5
  end



end
