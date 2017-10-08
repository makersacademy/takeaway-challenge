require 'order'

describe Order do

  subject(:process_order) { described_class.new(order) }
  let(:order){{dumplings: 1, curry: 1, beer: 1}}


  #context 'add multiple items' do
    #before(:each)do
     #takeaway.add('item')
     #takeaway.add('item')
     #takeaway.add('second_item')
    #end

  it 'processes order' do
    expect(process_order).to respond_to(:calculate_total)
  end


  it 'fills up takeaway basket and process total price' do
  process_order.calculate_total
  expect(process_order.basket).to eq({dumplings_x_1: '£5', curry_x_1: '£5', beer_x_1: '£4', total: '£14'})
  end



end
