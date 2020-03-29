require 'menu'

describe Menu do

  it 'returns a list of dishes on #list' do
    expect(subject.list).to include(
      :fish => "£5",
      :chips => "£3",
      :salad => "£2"
    )
  end

end
