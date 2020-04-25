require 'menu'

describe Menu do
  it 'ad' do
    expect(subject.menu).not_to be_empty
  end
end
