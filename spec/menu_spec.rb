require 'menu'

describe Menu do
  it 'should contain a list of menu items' do
    expect(subject.items).to include({ name: "Peri Peri Chicken", cost: 8 })
  end
  describe '#view' do
    it 'should provide a list of dishes' do
      expect(STDOUT).to receive(:puts).with("Peri Peri Chicken")
      require 'menu'
      subject.view
    end
  end
end
