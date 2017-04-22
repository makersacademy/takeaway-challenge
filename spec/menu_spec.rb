require 'menu'

describe Menu do

  before { subject.load_menu('test_menu.csv') }

  it 'has a menu array' do
    expect(subject.menu).to be_a(Array)
  end

  it 'gets a CSV file' do
    expect(subject.menu).to eq [{ 'Test' => 1.50 }]
  end

end
