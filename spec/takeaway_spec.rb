require "coveralls/version"
require "coveralls/configuration"
require "coveralls/api"
require "coveralls/output"
require "coveralls/simplecov"

require 'takeaway'
  
describe TakeAway do

  subject(:takeaway) {described_class.new}

  it 'responds to menu_list' do
    expect(takeaway).to respond_to :read_menu
  end

  it 'expect @order to be updated with menu_item' do
    takeaway.add_item_to_order('carrot', 1)
    expect(takeaway.order).to include('carrot')
  end

  it 'shows the cost of the customer order' do
    takeaway.add_item_to_order('carrot', 1)
    expect(takeaway.total_cost).to eq '£1.0'
  end

  it 'resonds to "pay"' do 
    expect(takeaway).to respond_to :pay
  end

    describe '#pay' do
      it 'raises error if amount not correct' do
        takeaway.add_item_to_order('kiwi')
        expect(takeaway.pay(9)).to raise_error 'Error: amount does not equal total cost!'
      end
    end
end



















