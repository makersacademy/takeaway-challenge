require 'menu'

describe Menu do

  it 'has a default collection of dishes that can be listed' do
    expect(subject.list_dishes).to include(a_kind_of(Dish))
  end

end
