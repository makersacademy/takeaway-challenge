require 'order'

describe Order do
let(:mock_menu) {double :menu_object, :list => {pizza: 10.00, pasta: 5.00}}
let(:mock_confirmation) {double :confirmation_object, :send => "Thank you! Your order was placed and will be delivered"}
subject(:order) {described_class.new(mock_menu, mock_confirmation)}
let(:meal) { double :meal}

  describe '#menu' do
    it 'order should respond to menu method' do
      expect(order).to respond_to(:menu)
    end

    it 'should return a hash of menu items' do
      expect(order.menu).to be_a Hash
    end
  end

  describe '#select' do
    it 'order should respond to the select method' do
      expect(order).to respond_to(:select)
    end

    it 'should return inputted selection' do
      expect(order.select(meal)).to eq [meal]
    end

    it 'should let user pass multiple arguments' do
      expect(order.select(meal, meal, meal)).to eq [meal, meal, meal]
    end
  end

  describe '#total' do
    it 'order should respond to total method' do
      expect(order).to respond_to(:total)
    end

    it 'should calculate total for selection' do
      order.select(:pizza)
      expect(order.total).to eq 10
    end

    it 'should calculate total for selection with multiple items' do
      order.select(:pizza, :pasta)
      expect(order.total).to eq 15
    end
  end

  describe '#confirm(answer)' do
    it "raise error if user doesn't confirm order" do
      error = "Order cancelled, please select items"
      expect{order.confirm(false)}.to raise_error error
    end

  end


end
