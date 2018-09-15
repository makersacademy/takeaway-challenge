require 'menu'

describe Menu do
  describe 'instantiation' do
    it '@list is set to LIST' do
      expect(subject.list).to eq(Menu::LIST)
    end
  end

  describe '#display' do
    it 'prints out @list in user-friendly format' do
      response =  "\u2022 Fish and Chips      £12.95\n"\
                  "\u2022 Roast Dinner        £14.95\n"\
                  "\u2022 Avocado Toast       £19.95\n"
      expect { subject.display }.to output(response).to_stdout
    end
  end
end
