describe 'Features' do

  #As a customer
  #So that I can check if I want to order something
  #I would like to see a list of dishes with prices
  describe 'A customer prints the menu to see available dishes/prices' do
    it 'TakeAway.show_menu displays the menu in the terminal window' do
      expect { TakeAway.show_menu }.to output(
        "1 - Roast pork - £15\n" +
        "2 - Steamed broccoli - £3\n" +
        "3 - Roasted spinach - £8\n" +
        "4 - Smelly fruit - £12\n").to_stdout
    end
  end 


  #As a customer
  #So that I can order the meal I want
  #I would like to be able to select some number of several available dishes
  describe 'A customer selects a number of available dishes' do
    it 'Takeaway.order allows the user to order' do
      expect { TakeAway.order(44, [3,5], [2,1])}.not_to raise_error
    end
  end
end 
