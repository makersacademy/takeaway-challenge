require 'takeaway' 

describe Takeaway do
  let(:takeaway) {Takeaway.new}
  it 'can display a list of dishes with prices' do
    expect{takeaway.view_menu}.to output("Margherita, £9.99\nNeapolitan, £12.99\nGreek, £13.99\nPadana, £11.99\n").to_stdout
  end

  it 'can allow a user to select items from the menu' do
    takeaway.view_menu
    takeaway.select_item("Neapolitan", 1)
    expect(takeaway.basket).to eq([{:pizza => "Neapolitan", :price => 12.99}])
  end
end