require 'menu'

describe Menu do

  it 'lets the customer see a list of dishes and prices' do
    expect(subject.list_menu).to eq(['Plantain fries....£3',
                                     'Banana Curry....£8',
                                     'Banoffee Pie....£5',
                                     'Banana Milkshake....£3'])
  end

end
