require 'order.rb'

describe 'scenarios' do
  let(:subject) { Order.new }
  describe 'Confirm with correct order' do

    it 'should send a text' do
      subject.make_order("Chicken Burger", 1)
      subject.make_order("BBQ Chicken Wings", 1)
      subject.confirm(14.70)
    end

    it 'should return the correct order' do
      subject.make_order("Chicken Burger", 2)
      subject.make_order("BBQ Chicken Wings", 1)
      expect(subject.menu.current_order.length).to eq 2
    end

    it 'should return the error' do
      subject.make_order("Chicken Burger", 2)
      subject.make_order("BBQ Chicken Wings", 1)
      expect { subject.confirm(10) }.to raise_error("not the right money")
    end

    it 'should have a error if item does not exist' do
      expect { subject.make_order("Pizza", 2) }.to raise_error("There is no dish with that name")
    end

    it 'should raise error if out of stock' do
      subject.make_order("Chicken Burger", 2)
      expect { subject.make_order("Chicken Burger", 5) }.to raise_error("Sorry there is not enough in stock")
    end
  end
end
