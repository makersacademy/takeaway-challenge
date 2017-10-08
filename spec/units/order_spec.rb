require 'order'

describe Order do
  class MockDish
    attr_reader :name, :price_per_unit
    attr_accessor :quantity_ordered
    def initialize name, price_per_unit
      @name = name
      @price_per_unit = price_per_unit
      @quantity_ordered = 0
    end
    
    def readable
      "#{'%-30s' % (name + ":")} £#{'%5.2f' % (quantity_ordered * price_per_unit)}"
    end
  end
  let(:dish_1) { MockDish.new 'Pizza Diavola', 10 }
  let(:dish_2) { MockDish.new 'Tagliatelle with duck ragu', 9 }
  let(:dish_3) { MockDish.new 'Salad Caprese', 8.5 }
  let(:dishes) { [dish_1, dish_2, dish_3] }
  let(:send_sms) { double(:send_sms, :send => true) }
  let(:send_sms_class) { double(:send_sms_class, :new => send_sms) }
  subject(:order) { described_class.new send_sms_class }
  describe '#initialize' do
    it 'sets up an empty array to contain selected dishes' do
      expect(order.selected_dishes).to eq []
    end
  end
  describe '#select' do
    it 'enables users to choose an item on the menu and save it to the selection array' do
      order.select 'Pizza Diavola', 1, dishes
      expect(order.selected_dishes[0].name).to eq 'Pizza Diavola'
    end
    it 'enables users to choose a particular number of items' do
      order.select 'Pizza Diavola', 3, dishes
      expect(order.selected_dishes[0].quantity_ordered).to eq 3
    end
    it 'tells a user if they are trying to order something that is not available' do
      expect(order.select 'Pizza Napolitana', 1, dishes).to eq 'Sorry, that is not available'
    end
    it 'enables users to add muliples items' do
      order.select 'Pizza Diavola', 3, dishes
      order.select 'Tagliatelle with duck ragu', 1, dishes
      order.select 'Salad Caprese', 2, dishes
      expect(order.selected_dishes.length).to eq 3
    end
  end
  describe '#check' do
    total_cost = (3 * 10) + 9
    before(:each) do
      order.select 'Pizza Diavola', 3, dishes
      order.select 'Tagliatelle with duck ragu', 1, dishes
    end
    it 'raises an error if the price supplied by the customer does not match the calculated total price' do
      expect { order.check 30 }.to raise_error "Sorry, our sums do not match"
    end
    it 'returns a string' do
      expect(order.check total_cost).to be_a String
    end
    it 'which contains the names of the dishes ordered' do
      matches = order.check(total_cost).scan 'Pizza Diavola'
      matches += order.check(total_cost).scan 'Tagliatelle with duck ragu'
      expect(matches.length).to be 2
    end
    it 'and contains the total cost of the dishes ordered' do
      expect(order.check total_cost).to include total_cost.to_s
    end
  end
end
