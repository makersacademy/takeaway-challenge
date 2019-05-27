require 'takeaway' 

describe Takeaway do
  let(:takeaway) {Takeaway.new}
  it 'can display a list of dishes with prices' do
    expect{takeaway.view_menu}.to output("Margherita, £9.99\nNeapolitan, £12.99\nGreek, £13.99\nPadana, £11.99\n").to_stdout
  end

  #The below functionality has moved to basket responsibility
  #TODO stub the select_item for takeaway in order to test 
  # it 'can allow a user to select items from the menu' do
  #   takeaway.view_menu
  #   takeaway.select_item("Neapolitan", 1)
  #   expect(takeaway.basket).to eq([{:pizza => "Neapolitan", :price => 12.99}])
  # end

  it 'can display a basket' do
    takeaway.view_menu
    takeaway.select_item("Neapolitan", 2)
    expect{takeaway.view_basket}.to output("Neapolitan x2, £25.98\n").to_stdout
  end

  it 'can display basket total' do 
    takeaway.view_menu
    takeaway.select_item("Neapolitan", 2)
    expect(takeaway.view_total).to eq 25.98

  end
end