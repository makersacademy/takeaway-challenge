require 'menu'


describe Menu do


  it 'expects Menu to respond to check_menu' do
    expect(subject).to respond_to(:check_menu)
  end

  it 'see a list of dishes with prices' do
    expect(subject.check_menu).to include("hamburger" => 2)
  end

  it 'responds to select_dishes method' do
    expect(subject).to respond_to(:select_dishes)
  end

  it 'can place an order containing multiple items' do
    subject.select_dishes('hamburger', 'pizza')
    expect(subject.order).to include('hamburger', 'pizza')
  end 

  xit 'raises an error if selection is not on the menu' do
    expect(subject.select_dishes('noodles')).to eq('Noodles is not on our menu')
  end

  it 'checks the total price given matches the sum of the total order' do
    subject.select_dishes('hamburger', 'pizza')
    expect(subject.check_total).to eq(7)
  end



  end