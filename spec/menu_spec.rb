require 'menu'

describe Menu do

 it 'it has a list of dishes' do
   expect(subject.dishes).to be_a_kind_of(Array)
 end

  it 'can list all of the dishes' do
    expect(subject.list).to be_a_kind_of(String)
  end

end