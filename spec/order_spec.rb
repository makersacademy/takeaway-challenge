require './lib/order.rb'
require './lib/menu.rb'

describe Order do
#subject(Order.new)
describe 'lists the dishes and prices' do
  it {
  expect(subject.view_dishes).to include({:name=>"biriyani", :cost=>"3"})
  }
end
describe 'select dishes ordered' do
  it {
  subject.select_dishes("biriyani", 1)
  expect(subject.selected_items.length).to eq(1)
  }
end
describe 'shows total for select dishes ordered' do
  it {
  subject.select_dishes("biriyani", 1)
  subject.select_dishes("cake", 2)
  expect(subject.total).to eq(11)
  }
end
end