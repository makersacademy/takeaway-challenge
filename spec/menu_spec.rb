require 'menu'

describe Menu do 

  let(:dishes) { { curry: 6,
    rice: 5,
    burger: 4,
    chips: 2,
    wings: 5 }
  }

  it 'shows a list of dishes' do
    expect(subject.dishes).to eq dishes
  end
  
  it 'calculates the price' do
    expect(subject.price(:chips)).to eq dishes[:chips]
  end
  
  it 'shows if a dish is not on menu' do
    expect(dishes.include?(:pasta)).to be false
  end

  it 'shows if a dish is on menu' do
    expect(dishes.include?(:wings)).to be true
  end

end 
