require 'order'

describe Order do 
    let(:price) {5.99}
    let(:choices) {double :Menu_choices, dishes: [{:dish => 'green curry', :price => 5.99}]}
    let(:order) { Order.new(choices) }

    it 'should require one param for intialize set this to dishes' do
        expect(order.dishes).to eql(choices) 
    end

    describe ' #sum' do 

        before { order.sum }

       it 'should return an integer of the sum of @dishes ' do
            #double problem
            expect(order.total).to eql(5.99)
       end
    end


end