require 'pricecheck'

describe PriceCheck do

menu = Menu.new

it 'sums up the total correctly' do
  order = double('order', :items => {'broccoli' => 4, 'tofu' => 3}, :payment => 13)
  expect(subject.sum(order, menu)).to eq 13
end

it 'states correctly whether payment and total match' do
  order = double('order', :items => {'broccoli' => 4, 'tofu' => 3}, :payment => 13)
  subject.sum(order, menu)
  expect(subject.verify(order)).to be true
end


end
