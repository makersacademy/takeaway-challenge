require 'customer'

describe Customer do
  
  it 'can see a list of dishes with prices' do
    expect(subject.view_dishes).to eq 'Noodles (£3.00), Rice (£2.50)'
  end
  
  context 'can select available dishes' do
  	it 'can select 1 x Noodles' do
      expect(subject.select_dish :Noodles, 1).to eq '1 x Noodles added'
    end
  end

end