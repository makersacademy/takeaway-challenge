require 'menu'


describe Menu do


  it 'expects Menu to respond to check_menu' do
    expect(subject).to respond_to(:check_menu)
  end

  it 'see a list of dishes with prices' do
    expect(subject.check_menu).to include(:dish => 'price')
  end

  it 'responds to select_dishes method' do
    expect(subject).to respond_to(:select_dishes)
  end

  it 'can place an order' do
    subject.select_dishes('hamburger')
    expect(subject.order).to include('hamburger')
  end 

  it 'raises an error if selection is not on the menu' do
    expect(subject.select_dishes('noodles')).to raise_error('That selection is not on our menu')
  end



  end