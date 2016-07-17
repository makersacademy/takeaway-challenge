require 'menu'

describe Menu do

  it 'allows user to view contents of menu' do
    expect(subject.view).to eq subject.dishes
  end

end
