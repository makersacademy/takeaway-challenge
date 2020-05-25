require 'menu'

describe Menu do

  it 'should contain MY_MENU' do
    expect(subject.dishes).to eq(Menu::MY_MENU)
  end

  describe '#print_menu' do
    it 'should output MY_MENU' do
      expect { subject.print_menu }.to output.to_stdout
    end
  end
end
