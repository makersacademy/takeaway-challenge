require 'basket'

describe Basket do
    let(:basket) { Basket.new }
    it 'starts with an empty basket' do
        expect(basket.basket).to eq({})
    end

    it 'starts with a balance of 0' do
        expect(basket.total).to eq(nil)
    end

    describe '#add' do
        it 'can add an item to the basket' do
            expect { basket.add("pizza", 1) }.to change { basket.basket }.from({}).to({"pizza" => 1})
        end

        # it 'can add multiple items to the basket' do
        #     expect { }
        # end
    end

    describe '#show_basket' do
        it 'shows what is in the basket' do
            basket.add("burger", 1)
            basket.add("pizza", 2)
            expect(basket.show_basket).to eq({"burger" => 1, "pizza" => 2})
        end
    end
    
end