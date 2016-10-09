require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it 'should contain a hash of items and prices' do
    expect(subject.menu_list).to include({"haddock" => 6})
  end

end
