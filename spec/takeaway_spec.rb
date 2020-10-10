require 'takeaway'

describe Takeaway do
  let(:carnal) {Menu.new}

#As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'displays the menu' do
    expect(subject.display_menu).to eq [{:Guacamole=>2}, {:Nachos=>5}, {:Tacos=>5}, 
      {:Quesadillas=>6}, {:Taquitos=>10}, {:Tostada=>4}, 
      {:Burrito=>8}, {:"Patatas Bravas"=>5}]
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it 'allows the customer to select dishes' do
    subject.add_dish('Guacamole', 2)
    expect(subject.basket).to eq "Guacamole"=>2
  end

end