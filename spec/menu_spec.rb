require 'menu'

describe Menu do

  it 'see a hash of dishes with prices' do
    expect(subject.menu_items).to be_a Hash
  end

end
