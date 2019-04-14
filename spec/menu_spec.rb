require 'menu'
describe Menu do
  let(:meals) do
  { Tacos: 6,
    Quesadillas: 5,
    Torta: 4,
    Burrito: 3 }
  end

  it 'prints menu list' do
    expect(subject.meals).to eq meals
  end
end
