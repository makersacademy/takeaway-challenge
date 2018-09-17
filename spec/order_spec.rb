require 'order'

describe Order do
  let(:quantity)      { double :quantity }

  context '#add_item' do
    it 'error if item is not on the menu' do
      expect{ subject.add_pizza("coffee", quantity) }.to raise_error "#{dish.capitalize} item not on offer"
    end

    it 'adds to order' do
      subject.add_pizza("margherita", quantity)
      expect(subject.order).to include ["margherita", quantity]
    end
  end


  context '#claculate_price' do
    it 'calculates the total' do
      subject.add_pizza("margherita", 2)
      subject.add_pizza("pepperoni", 1)
      expect(subject.claculate_price).to eq 26
    end
  end

end



# require 'order'
#
# describe "customer's order" do
#
#   # let(:customer) { double :margherita, 2 }
#
#   describe Order do
#     let(:quantity)      { double :quantity }
#
#       it 'adds a pizza' do
#         subject.add_pizza("margherita", quantity)
#         expect(subject.order).to include ["margherita", quantity]
#       end
#     end
# end
