require 'menu'

describe Menu do

  it 'displays menu' do
    expect(subject.menu_list).to be_a Hash
  end
end