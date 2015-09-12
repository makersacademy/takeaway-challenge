require 'customer'

describe Customer do

  let(:takeaway) { Takeaway.new }

  it 'customer should be able to view meny' do
    expect(subject).to respond_to(:view_menu).with(1).argument
  end

  describe '#place_order' do 

    it 'customer should be able to place order' do
      expect(subject).to respond_to(:place_order)
    end

    it 'should raise an error if customer order is not on menu' do
      expect{subject.place_order(takeaway, "Fries")}.to raise_error("Sorry that item is not on the menu")
      end

  end

end
