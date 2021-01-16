require 'takeaway'

describe Takeaway do
let(:dish) {Dish.new('Chicken chow mein', 5)}
let(:input) {{dish: dish, quantity: 2}}

  describe ' #initialize' do

    it "makes an empty array upon creation" do
      expect(subject.order).to eq Array.new
    end

  end

  describe ' #add_dish' do

    it 'adds input to order' do
      subject.add_dish(2, dish)
      expect(subject.order[-1]).to include(input)
    end

    it 'order holds dish' do
      subject.add_dish(2, dish)
      expect(subject.order[-1][:dish]).to eq dish
    end

    it 'order holds dish quantity' do
      subject.add_dish(2, dish)
      expect(subject.order[-1][:quantity]).to eq 2
    end

  end

  describe ' #order_sum' do

    it 'calculates the sum of order' do
      subject.add_dish(2, dish)
      expect(subject.order_sum).to eq 10
    end

  end

end
