require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  let(:menu_layout) {
    "=======================\n   Mann Fang Lowe Co.  \n23 Creators St., London\n=======================\nDish: Price\n1. Chop Sooy, With White Mushrooms: £2.5\n2. Plain Chop Sooy: £2.0\n3. Guy Gang (Chicken Soup): £3.0\n4. Vegetable Soup: £3.5\n5. Guysue Mein (Noodle Soup With Chicken): £3.0\n6. Yet Quo Mein (Noodle Soup With Pork): £2.0\n7. One Hone (Boiled Chicken And Dumpling): £3.4\n8. Chow Mein (Fried Noodle With Boneless Chicken) (L): £6.0\n9. Chow Mein (Fried Noodle With Boneless Chicken) (S): £4.0\n10. Bor Low Guy Pan (Boneless Chicken With Pineapple): £7.1\n11. Lychee Guy Pan (Boneless Chicken With Lychee): £7.5\n12. Guy Fou Yong Dun (Chicken Omelet): £8.0\n13. Fou Yong Guy Pan (Chicken With Scrambled Eggs): £6.5\n14. Jar Jee Guy (Boneless Chicken Fried In Crackerdust): £2.6\n15. Mou Goo Guy Pan (Boneless Chicken With White Mushrooms): £7.0\n16. Fou Yong Dun (Omelet With Ham): £5.5\n17. Fou Yong Dun (Plain Omelet): £4.2\n18. Fou Yong Ha (Omelet With Lobster): £7.7\n"
  }

  it 'initialized with a list of dishes and prices' do
    expect(menu.dishes).to eq SmarterCSV.process('./Mann_Fang_Lowe_Menu.csv')
  end

  it 'displays a list of dishes with prices' do
    expect(menu.view).to eq SmarterCSV.process('./Mann_Fang_Lowe_Menu.csv')
  end

  it 'should display menu introduction' do
    expect { menu.view }.to output(menu_layout).to_stdout
  end

end
