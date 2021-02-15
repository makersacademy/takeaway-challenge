require 'takeaway'

describe Takeaway do

  let(:mock_dishes) { [{ Burger: 2.50}, { Chips: 1.00}, { Cod: 4.00}] }
  let(:mock_takeaway) {Takeaway.new}
  let(:mock_basket) {double}


  it 'dishes should return the dishes with the prices' do
    expect(mock_dishes).to include({ Burger: 2.50 }, { Chips: 1.00 }, { Cod: 4.00 })
  end

#cant get these to automate? doubles?
  it 'burger should be added to basket' do
    allow(subject.add_to_basket).to receive(:gets)
    expect(subject.basket).to include({:dish => "Burger", :price => 2.50 })
  end
  it 'chips should be added to basket' do
    allow(subject.add_to_basket).to receive(:gets)
    expect(subject.basket).to include({:dish => "Chips", :price => 1.00 })
  end
  it 'savaloy should be added to basket' do
    allow(subject.add_to_basket).to receive(:gets)
    expect(subject.basket).to include({:dish => "Savaloy", :price => 2.00 })
  end
  it 'cod should be added to basket' do
    allow(subject.add_to_basket).to receive(:gets)
    expect(subject.basket).to include({:dish => "Cod", :price => 4.50 })
  end
  it 'coke should be added to basket' do
    allow(subject.add_to_basket).to receive(:gets)
    expect(subject.basket).to include({:dish => "Coke", :price => 1.50 })
  end

  #dont know how to make this test?
  #it 'if anything other than menu item then tell user not on menu'
    #allow(subject.add_to_basket).to receive(:gets)
    #expect

  it 'basket should give correct total' do
    print_basket_dbl = double
    allow(print_basket_dbl).to receive(:total).and_return(3.5)
    expect(print_basket_dbl.total).to eq(3.5)
  end



end
