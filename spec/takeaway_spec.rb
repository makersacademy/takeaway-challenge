require 'takeaway'

describe Takeaway do

  it 'loads a complete menu with a list of dishes & prices' do
    expect(subject.view_menu).to match ({"pasta": 7, "dhal": 9 , "pizza": 10 , "chocolate": 9})
  end

  it 'allows me to order a dish with a quantity' do 
    expect(subject).to respond_to(:order).with(2).arguments
  end

  it 'adds the correct order to my complete_order' do
    subject.order("pasta", 2)
    expect(subject.basket).to include("pasta" => 2)
  end

  it 'keeps track of my orders so that I can order multiple dishes' do
    # want the length of my order_array to increase to show a new item
    subject.order("dhal", 1)
    expect { subject.order("pasta", 2) }.to change { subject.basket.length}.by 1
  end

  it 'updated my order quantity when I order the same dish multiple times' do
    subject.order("dhal", 1)
    subject.order("dhal", 1)
    expect(subject.basket).to include("dhal" => 2)
  end
    
  it 'gives me a total for my order ' do  
    subject.order("dhal", 1)
    subject.order("pizza", 2)
    expect(subject.total).to eq (29)
  end
  # can update the quantity of my an existing ordered dish
end