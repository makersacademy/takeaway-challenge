require 'list'

describe List do
  it { is_expected.to respond_to :see }
    
  it 'shows dish price pairs' do
    menu = { 'apple' => 3 }
    expect(subject.see).to eq(menu)
  end

  it 'lets the user choose a of a dish' do
    menu = { 'apple' => 3 }
    expect(subject.apple).to eq(menu)
  end

  it 'lets the user add several units of a dish to their meal' do
    menu = { "apple" => 3 }
    meal = subject.apple(2)
    expect(meal).to eq("2 * {\"apple\"=>3}")
  end
end
