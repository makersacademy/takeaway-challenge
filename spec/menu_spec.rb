require 'menu'

describe Menu do

  it 'should be able to view contents of menu' do
    expect(subject.view).to eq subject.menu
  end

  
end
