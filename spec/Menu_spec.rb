require 'Menu'

describe Menu do

let(:menu) { Menu.new }

it 'Has a menu class' do
  expect { subject.food_list }.to_not raise_error
end

it 'Has items of food' do
  expect(subject.food_list[1]).to eq 'fish' => 10
end 

it "Moves items to order" do
  expect(subject.order).to eq [{ 'chicken' => 15 }, { 'fish' => 10 }] 
end
end