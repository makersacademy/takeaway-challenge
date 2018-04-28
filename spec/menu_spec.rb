require 'menu'

describe Menu do
  allow(subject).to receive(:menu_csv) { [] }
  it 'has a view_menu method' do
    expect(subject).to respond_to(:view_menu)
  end

  it 'loads a csv file and saves it to menu csv' do
    expect(subject.menu_csv).to be_an_array
  end

  describe '#dishes' do
    it 'should have a collection of dishes' do
      expect(subject).to respond_to(:dishes)
    end
  end

  describe 'menu_load' do

  end
end
