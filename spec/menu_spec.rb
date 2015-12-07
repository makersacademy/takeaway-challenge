require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'can return hash of dishes and prices' do
    expect(menu.raw).to eq('Spring Rolls' => 2.99, 'Crispy Duck' => 6.99)
  end

  it 'can return formatted dishes and prices' do
    expect(menu.format).to eq("Spring Rolls.............£2.99\n"\
                              "Crispy Duck..............£6.99\n")
  end

end
