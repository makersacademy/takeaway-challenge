require 'menu'

describe Menu do

  let(:dishes) do
    { "pork bao": 4,
      "chicken bao": 4 }
    end

  subject { described_class.new(dishes) }

  it 'returns a list of dishes' do
    expect(subject.dishes).to eq dishes
  end

  it 'displays a list of dishes and prices' do
    expect(subject.view_menu).to eq("1. Pork bao......£4 2. Chicken bao......£4 ")
  end

end
