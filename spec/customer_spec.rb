require 'customer'

describe Customer do

  let(:takeaway) { Takeaway.new }

  it 'customer should be able to view meny' do
    expect(subject).to respond_to(:view_menu).with(1).argument
  end

  describe '#add_item' do

    it 'customer should be able to place order' do
      expect(subject).to respond_to(:add_item)
    end

    it 'should raise an error if customer order is not on menu' do #need adjusting
      expect{subject.add_item(takeaway, "Fries")}.to raise_error("Sorry that item is not on the menu")
      end
  end

  describe '#bill' do

    it 'should calculate the customers final bill' do
    menu = { 'Tomato soup' => 5,
              'Steak and chips' => 15}
    subject.add_item(takeaway,"Steak and chips")
    subject.add_item(takeaway,"Tomato soup")
    expect(subject.bill(takeaway)).to eql(20)
    end

  end

end
