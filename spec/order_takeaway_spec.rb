require 'order_takeaway'
require 'basket'
require 'menu'

describe OrderTakeaway do

    it 'should place your order if satisfied with your basket' do
        expect(subject.order.place_order).to eq true
    end


end 