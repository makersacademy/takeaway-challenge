require 'calculate_order'
require 'order'

describe CalculateOrder do

  describe "#calculate" do

    let(:dish_1) { { :name => "sushi festival", :price => 3 } }
    let(:dish_2) { { :name => "chicken teriyaki dragon roll", :price => 4 } }
    let(:takeaway) { [{ :name => "sushi festival", :price => 3 }, { :name => "chicken teriyaki dragon roll", :price => 4 }, { :name => "salmon & avo dragon roll", :price => 5 }] }

    it 'should calculate the order total for one dish' do
      subject.calculate([dish_1])
      expect(subject.balance.to_i).to eq 3
    end

    it 'should calculate the order total for more than one dish' do
      subject.calculate(takeaway)
      expect(subject.balance.to_i).to eq 12
    end

    # review this test!
    # it 'should calculate the order total' do
    #   dishes = DishesList.new
    #   dishes.view_list
    #   order = Order.new
    #   order.add_order(takeaway)
    #   #order.add_order(dish_2)
    #   expect(subject.order_total.to_i).to eq 7
    # end

    # it 'should calculate the order total' do
    #   dishes = DishesList.new
    #   order = Order.new
    #   dish = Dish.new( {:name => "dish_name", :price => 1} )
    #   order.add_order( dish.dish )
    #   #order.add_order(dish_2)
    #   expect(subject.order_total.to_i).to eq 1
    # end

  end

end
