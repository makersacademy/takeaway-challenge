require 'takeaway.rb'

describe Takeaway do

  it 'shows menu when requested' do
    t = Takeaway.new
    expect(t.view_menu).to eq t.menu
  end

  it 'lets customer select items to order and confirms selection' do
    t = Takeaway.new
    expect(t.select('chips', 'rice')).to eq "You ordered: chips, rice. The total is 6."
  end


end
