require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) {double(:menu, :list => {pizza: 5, carbonara: 6}, :create_menu_string => "pizza - £5, carbonara - £6 ") }
  let(:inputoutput) {double(:inputoutput)}
  describe '#order_hash'do
    it "order_hash is an hash" do
      expect(order.order_hash).to be_empty
    end
  end
  describe '#add_dish_to_order' do
    it "adds the dish to the order hash" do
      order.add_dish_to_order(:pizza)
      expect(order.order_hash).to eq pizza: 1
    end
  end
  describe '#change_quantity_of_dish' do
    it "amends the quanity" do
      order.add_dish_to_order(:pizza)
      order.change_quantity_of_dish(:pizza,2)
      expect(order.order_hash).to eq pizza: 2
    end
  end
  describe '#total of order' do
    it "gives the total of the whole order" do
      order.add_dish_to_order(:pizza)
      order.change_quantity_of_dish(:pizza,2)
      expect(order.total_of_order).to eq 10
    end
    it "gives the total of the whole order" do
      order.add_dish_to_order(:pizza)
      order.change_quantity_of_dish(:pizza,3)
      expect(order.total_of_order).to eq 15
    end
  end
  describe '#check_order_amount' do
    it 'checks the total amount of the order against an input' do
      order.add_dish_to_order(:pizza)
      order.change_quantity_of_dish(:pizza,3)
      allow(order).to receive(:print)
      allow(order).to receive(:gets).and_return("15")
      expect(order.check_order_amount).to eq true
    end
    it 'Error if the total amount of the order is not equal to the input' do
      order.add_dish_to_order(:pizza)
      order.change_quantity_of_dish(:pizza,3)
      allow(order).to receive(:print)
      allow(order).to receive(:gets).and_return("10")
      expect {order.check_order_amount }.to raise_error RuntimeError
    end
  end
  describe '#multiple_dishes' do
    it 'true if a person wants multiple dishes'do
    allow(order).to receive(:print)
    allow(order).to receive(:gets).and_return("yes")
    expect(order.multiple_dishes).to be true
  end
    it 'is false if a person does not want multiple dishes' do
      allow(order).to receive(:print)
      allow(order).to receive(:gets).and_return("ghugh")
      expect(order.multiple_dishes).to be false
    end
  end
  describe '#check_dish_against_menu' do
    it 'checks a dish is within the menu'do
    expect(order.check_dish_against_menu('pizza')).to eq true
    end
    it 'checks a dish is not in the menu' do
      expect(order.check_dish_against_menu('bread')).to eq false
    end
  end
  describe '#number_of_portions' do
    it 'checks a dish is within the menu'do
    allow(order).to receive(:print)
    allow(order).to receive(:gets) { "2" }
    order.number_of_portions(:pizza)
    expect(order.order_hash).to eq pizza: 2
    end
  end
  describe '#ordering_a_dish' do
    it 'error if the dish is not on the menu' do
    allow(order).to receive(:print)
    allow(order).to receive(:gets).and_return('bread')
    expect { order.ordering_a_dish }.to raise_error (RuntimeError)
    end
    it 'adds dishes to the order_hash' do
      allow(order).to receive(:print)
      allow(order).to receive(:gets).and_return('pizza')
      allow(order).to receive(:print)
      order.ordering_a_dish
      expect(order.order_hash).to eq pizza: 1
    end
  end
end
