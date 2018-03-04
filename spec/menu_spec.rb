require 'menu'

describe Menu do
  it 'holds a hash of items' do
    expect(subject.menu_list).to include {}
  end
end
