require 'menu'

describe Menu do

  it 'lists the all the items on the menu' do
    expect(subject.print_dishes).to eq [{:Guacamole=>2}, {:Nachos=>5}, {:Tacos=>5}, {:Quesadillas=>6}, {:Taquitos=>10}, {:Tostada=>4}, {:Burrito=>8}, {:"Patatas Bravas"=>5}]
  end

  
end