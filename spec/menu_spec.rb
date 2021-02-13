require 'menu'

describe Menu do 
  dishes = {pierogi: 11.99, schnitzel: 14.99, rösti: 13.50}
  it 'stores a list of dishes and prices' do 
    expect(subject.dishes).to eq dishes
  end 


end 