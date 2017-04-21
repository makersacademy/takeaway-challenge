require './lib/order'

describe Order do
alias_method :order, :subject

it 'creates instance of Order class' do
  expect(order).to eq(order)
end


end
