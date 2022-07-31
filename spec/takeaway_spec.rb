require 'takeaway'

describe Takeaway do

  before do
    allow(subject).to receive(:price).with(:Nachos).and_return(5)
    allow(subject).to receive(:price).with(:Guacamole).and_return(2)
  end


#As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'displays the menu' do
    expect(subject.display_menu).to eq [{:Guacamole=>2}, {:Nachos=>5}, {:Tacos=>5}, 
      {:Quesadillas=>6}, {:Taquitos=>10}, {:Tostada=>4}, {:Burrito=>8}, {:"Patatas Bravas"=>5}]
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it 'allows the customer to select dishes' do
    subject.add_dish(:Guacamole, 2)
    expect(subject.basket).to eq Guacamole: 2
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have 
#been given matches the sum of the various dishes in my order

  it 'calculates the price' do
    expect(subject.price(:Nachos)).to eq(5)
  end

  it 'adds the dishes for a total price' do
    subject.add_dish(:Guacamole, 2)
    subject.add_dish(:Nachos, 3)

    expect(subject.order_total).to eq 19
  end

  # it 'prints the basket with dish, amount and price' do
  #   subject.add_dish('Guacamole', 2)
  #   subject.add_dish('Nachos', 3)

  #   expect(subject.basket_summary).to eq 'Guacamole x2 = £4.00, Nachos x3 = £15.00'

  # end

end