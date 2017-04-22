require 'menu'

describe Menu do

  test_menu = described_class.new('Test')

  it 'has a menu array' do
    expect(test_menu.menu).to be_a(Array)
  end

  it 'gets a CSV file' do
    expect(test_menu.menu).to eq [{ 'Test' => 1.50 }]
  end

end
