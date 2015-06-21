require 'customer'

describe Customer do

  let(:shop) { double :shop }


  #FIX THIS!!!!
  xit 'can see a list of dishes with prices' do
    expect(subject.ask_for_menu shop).to eq(shop.show_menu)
  end #FIX THIS!!!!

  #FIX THIS!!!!
  xit 'can be able to select some number of several available dishes' do
    subject.ask_for_menu shop
    subject.select_dish('linguine')
    expect(subject.basket).to eq ['12'] #FIX THIS!!!!
  end



end