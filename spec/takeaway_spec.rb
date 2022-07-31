require 'takeaway'

describe Menu do 
subject(:menu) {described_class.new}

it "has a predefined menu" do 
 expect(menu.our_menu).to eq([{"Pizza" => 3}, {"Burger" => 4 }, {"Orange Juice" => 2}, {"Wine" => 7}])
end 

it '#list the available foods' do 
expect(menu).to respond_to(:list)
end 

# it 'shows all the available foods'
#  expect(menu.list) to 
# end 

end 

describe Order do 

end 

describe Takeaway do 
end 

