require 'customer_order'

describe CustomerOrder  do
  
  subject(:customer_order) { described_class.new }

  context 'initialiazation' do
    it 'defaults to an empty order' do
      expect(customer_order.order_dishes).to eq Hash.new(0)
    end

    it 'defaults to a total of 0.00' do
    end
  end

  context '#add_items' do
    it { is_expected.to respond_to :add_items }

    # it 'should add the value to the total' do
    # end


    it 'should add lines to the order' do
      expect{ customer_order.add_items(:dish_one, 10) }.to change { customer_order.order_dishes.length }.by 1
    end
  end

  context '#display_order' do
    # it 'should calculate the total for each line' do
    # end

    # it 'should return the list of dishes and prices on separate lines' do
    #   expect(STDOUT).to receive(:puts).exactly(customer_order.order_dishes.length).times
    #   customer_order.add_items(:test,1,2)
    #   customer_order.add_items(:test2,3,4)
    #   customer_order.display_order
    # end
  end
  
end