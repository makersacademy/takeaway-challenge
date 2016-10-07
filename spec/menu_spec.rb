require 'menu'

describe Menu do

  it 'should show a menu list with dishes and prices' do
    expect(subject.show).to eq(subject.dishes)
  end

end
