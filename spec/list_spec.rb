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
    order = subject.apple(2)
    expect(order).to eq([2, menu])
  end

  it 'lets the user add the same item several times to their meal' do
    menu = { "apple" => 3 }
    order = [{ "apple" => 3 }, { "apple" => 3 }]
    expect(order).to eq([{ "apple" => 3 }, { "apple" => 3 }])
  end
end
