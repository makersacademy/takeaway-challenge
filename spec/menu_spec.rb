require 'menu'

describe Menu do

  context 'prints menu information' do

    it '#print_menu_info prints out food and prices' do
      information = "1 Satay, $5.0\n2 Kuih, $3.0\n3 RotiCanai, $6.0\n4 Bihun, $8.0\n"
      expect{subject.print_menu_info}.to output(information).to_stdout
    end
  end



end
