require 'menu'

describe Menu do 

  let(:dishes) do
    { curry: 6,
      rice: 5,
      burger: 4,
      chips: 2,
      wings: 5 }
  end

  it 'shows a list of dishes' do
    expect(subject.dishes).to eq dishes
  end
end
