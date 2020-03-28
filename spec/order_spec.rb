require 'order'

describe Order do

  it 'returns the menu on #menu' do
    expect(subject.menu).to include(
      :fish => 5,
      :chips => 3,
      :salad => 2,
    )
  end

end
