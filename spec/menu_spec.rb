require 'menu'

describe Menu do

  it 'should print menu' do
    expect(subject.display).to eq subject.menu
  end  
end
