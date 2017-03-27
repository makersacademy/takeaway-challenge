require 'menu'

describe Menu do

  subject(:menu) {described_class.new}

  describe '#initialize' do
    it 'has the correct list' do
      expect(menu.list).to eq ({'tofu' => 3, 'broccoli' => 1, 'radish' => 2, 'seitan' => 5})
    end
  end

  it 'prints a list to the console' do
    expect {menu.display}.to output.to_stdout
  end

end
