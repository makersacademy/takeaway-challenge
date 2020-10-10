require './lib/menu'
describe Menu do
  it 'has a list of dishes with prices' do
    expect(subject.dishes).not_to be_empty
  end

  it 'can view a list of dishes with prices' do
    expect(subject.view_dishes).to eq subject.dishes
  end
end
 
  