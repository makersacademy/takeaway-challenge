require 'menu'

describe Menu do 

  it 'should have a list of available dishes' do
   expect(subject).to respond_to(:dishes_available)
  end

  it 'should have available dishes' do
    expect(subject.dishes_available).to be_truthy
  end


end
