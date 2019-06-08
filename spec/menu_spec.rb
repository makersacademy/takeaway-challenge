require 'menu'

describe Menu do
  it 'should have a list of items' do
    expect(subject.food).not_to be_empty
  end


end
