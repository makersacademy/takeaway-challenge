require 'takeaway' 

describe Takeaway do
  it 'can display a list of dishes with prices' do
    takeaway = Takeaway.new
    list = takeaway.menu
    expect(list).to eq ([{:pizza => "Margherita", :price =>  9.99}, {:pizza => "Neapolitan", :price => 12.99}])
  end
end