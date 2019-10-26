require 'menu'

describe Menu do

  it 'expect menu to not be empty' do
    p subject.menu
    expect(subject.menu).not_to be_empty
  end

  

end
