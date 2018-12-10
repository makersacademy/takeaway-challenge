require 'order'

describe Order do 
    let(:price) {5.99}
    let(:choices) { double :Menu_choices, dishes: [{:dish => 'green curry', :price => 5.99}] }
    let(:order) { Order.new(choices) }

    it 'should require one param for intialize set this to dishes' do
        expect(order.dishes).to eql(choices) 
    end

    describe ' #sum' do 

        before { order.sum }

       it 'should return an integer of the sum of @dishes ' do
            #double problem
            expect(order.total).to eql(price)
       end
    end

    describe '#place_order' do 
      it 'expect a param of a customers phone number' do 
         expect(order).to respond_to(:place_order).with(1)
      end
    end 


end