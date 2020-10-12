require 'order_takeaway'
require 'basket'
require 'menu'

describe OrderTakeaway do

    it 'should place your order if satisfied with your basket' do
        subject.order
        expect(subject.place_order).to eq true
    end


end 