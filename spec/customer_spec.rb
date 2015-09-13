require 'customer'

describe Customer do

  let(:takeaway) { Takeaway.new }

    it 'customer should be able to view menu' do
      expect(subject).to respond_to(:view_menu).with(1).argument
    end

    it 'menu should appear when view_menu is called' do
      expect(subject.view_menu(takeaway)).to eql takeaway.menu
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

    it 'should raise an error if customer order is not on menu' do
      menu = {'Tomato soup' => 5,
              'Steak and chips' => 15}
      expect{subject.add_item(takeaway, "Hamburger")}.to raise_error("Sorry that item is not on the menu")
    end

  end

    it 'should respond to place_order method' do
      expect(subject).to respond_to(:place_order).with(1).argument
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
