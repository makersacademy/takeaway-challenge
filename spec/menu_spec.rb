require 'menu'

describe Menu do

  it 'contains a list of dishes and prices' do
    expect(subject.list).to eq({
      "margherita" => 8,
      "pepperoni"  => 9,
      "vegetarian" => 9
    })
  end

end
