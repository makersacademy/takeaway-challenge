require 'menu'

describe Menu do

  context 'prints menu information' do

    it '#print_menu_info prints out food and prices' do
      information = "1. Satay, $5.0\n2. Kuih, $3.0\n3. RotiCanai, $6.0\n4. Bihun, $8.0\n"
      expect{subject.print_menu_info}.to output(information).to_stdout
    end
  end

  context 'user can select order' do

    it '#select_order can select the food we order' do
      expect{subject.select_order(0,2)}.to output("Satay\nRotiCanai\n").to_stdout
  end
end
  
  # context 'The user bills matches the order' do
  #
  #   it '#total_order_price will calculate the total price of order' do
  #     subject.select_order(0,2)
  #     expect(subject.total_order_price).to eq(11)
  #   end
  # end



end
