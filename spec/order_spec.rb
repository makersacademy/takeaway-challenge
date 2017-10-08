require 'order'

describe Order do

  subject(:order) { described_class.new }
  #let(:order){{dumplings: 1, curry: 1, beer: 1}}


  #context 'add multiple items' do
    #before(:each)do
     #takeaway.add('item')
     #takeaway.add('item')
     #takeaway.add('second_item')
    #end

  it 'processes order' do
    expect(order).to respond_to(:process)
  end


  #end



end
