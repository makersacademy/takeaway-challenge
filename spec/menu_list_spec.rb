require 'menu_list'

describe 'List' do

  let(:menu_list) { List.new }

  it 'has a list when initialized' do
    expect(menu_list.list).to be_a(Hash)
  end
end
