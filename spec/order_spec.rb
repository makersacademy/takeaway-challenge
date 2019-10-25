require 'order'

describe Order do 
    let(:order_item) { double :item, name: "Cod", price: 5.0}
    it 'should be a type of order' do 
        expect(subject).to be_an_instance_of(Order)
    end 
    context 'order_list tests' do 
        it 'should have an empty order list' do 
            expect(subject.order_list).to eq([])
        end

        it 'should add item to the order_list' do 
            subject.add_item_to_order(order_item, 1)

            expect(subject.order_list.first).to eq(order_item)
        end

        it 'should add several items to the order_list' do 
            subject.add_item_to_order(order_item, 5)

            expect(subject.order_list.length).to eq 5
        end
    end
end