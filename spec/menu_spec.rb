require 'menu'

RSpec.describe Menu do

  it 'contains a list of dishes with prices' do
    expect(subject.menu_list).to be_a(Hash)
  end

end
