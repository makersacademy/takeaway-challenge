require 'customer'

describe Customer do

  let(:takeaway) { double(:takeaway, menu: {:tomato_soup => 5,
          :steak_and_chips => 15})}

  before :each do
    subject.add_item(takeaway, :steak_and_chips)
    subject.add_item(takeaway, :tomato_soup)
  end

  it 'should respond to place_order method' do
    expect(subject).to respond_to(:place_order).with(1).argument
  end

  it 'should respond to place order method and return true' do
    allow(subject).to receive(:place_order).and_return(true)
  end

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
      expect(subject.basket).to eql([:steak_and_chips, :tomato_soup])
    end

    it 'should raise an error if customer order is not on menu' do
      expect{subject.add_item(takeaway, :hamburger)}.to raise_error("Sorry that item is not on the menu")
    end
  end

  describe '#bill' do
    it 'should calculate the customers final bill' do
      expect(subject.bill(takeaway)).to eql(20)
    end
  end
end
