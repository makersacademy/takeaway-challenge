require 'customer'

describe Customer do

  let(:takeaway) { Takeaway.new }

  it 'customer should be able to view menu' do
    expect(subject).to respond_to(:view_menu).with(1).argument
  end

  describe '#add_item' do

    it 'customer should be able to add_item with 2 arguments' do
      expect(subject).to respond_to(:add_item).with(2).argument
    end

    it 'each item passed to method should be placed in basket' do
      subject.add_item(takeaway, "Steak and chips")
      subject.add_item(takeaway, "Tomato soup")
      expect(subject.basket).to eql(["Steak and chips", "Tomato soup"])
    end

    it 'should raise an error if customer order is not on menu' do #need adjusting
      expect{subject.add_item(takeaway, "Fries")}.to raise_error("Sorry that item is not on the menu")
      end
      
  end

    it 'should calculate the customers final bill' do
    menu = { 'Tomato soup' => 5,
              'Steak and chips' => 15}
    subject.add_item(takeaway,"Steak and chips")
    subject.add_item(takeaway,"Tomato soup")
    expect(subject.bill(takeaway)).to eql(20)
    end

  end
