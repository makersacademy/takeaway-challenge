require 'Order'

describe Order do
it 'Not raise error ordered items'  do
  expect { subject.ordered_items }.to_not raise_error
end
it 'Returns list of ordered items' do
  expect(subject.ordered_items).to eq [{ 'chicken' => 15 }, { 'fish' => 10 }] 
end
# it 'Total of order' do
#     expect(subject.order_total).to eq 25
# end
end 