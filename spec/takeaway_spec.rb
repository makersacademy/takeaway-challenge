require 'takeaway.rb'

describe Takeaway do
  # subject(:takeaway) {described_class.new}

  context 'Menu' do
    it 'should retreive a Menu' do
      expect(subject.menu).to be_a_kind_of(Hash)
    end

  end

  context 'Order' do
    it 'should allow the customer to create a new order' do
      expect(subject).to respond_to(:order)
    end

    it 'should allow the customer to add food to thier order' do
      food = "The special"
      subject.add_food(food)
      expect(subject.order.list).to eq ({food=>1})
    end

    it 'should prevent the customer from adding food not on the menu' do
      food = "The Big Mac"
      message = ("Sorry, that item isn't on the menu")
      expect{subject.add_food(food)}.to raise_error message
    end


    it 'should allow the customer to order 2 of the same item' do
      2.times{food = "The special"
      subject.add_food(food)}
      expect(subject.order.list).to eq({"The special" => 2})
    end


  end

end
