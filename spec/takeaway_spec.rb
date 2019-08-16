require 'takeaway'
describe Takeaway do
  it 'will list dishes with prices' do
  expect{subject.list}.to output{
  'Mango costs 2
  Burger costs 3
  Chips costs 2
  Croissant costs 12'}.to_stdout
  end
  it 'will select a number of dishes' do
  subject.choose("Burger")
  expect(subject.basket).to eq(['Burger'])
  end
end