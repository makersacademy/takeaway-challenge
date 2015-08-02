require 'menu'

describe Menu do

  let(:biriyani){double :biriyani, title: "Biriyani", price: 5.00}

  it 'has a default set of dishes' do 
    expect(subject.dishes).to eq Menu::DEFAULT_MENU
  end

  it 'can have dishes added to it' do
    subject.add_dish(biriyani, 5.00)
    expect(subject.dishes).to include biriyani
  end
end