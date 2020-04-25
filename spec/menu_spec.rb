require 'menu'

describe Menu do
  it 'creates menu' do
    expect(subject.menu).not_to be_empty
  end
end
