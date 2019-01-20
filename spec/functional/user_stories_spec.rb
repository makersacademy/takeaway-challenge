require 'takeaway'

RSpec.describe 'Functional tests' do
  let(:pieshop) { Takeaway.new('pieshop') }
  let(:menu) { Menu.new('menu.csv') }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'shows list of dishes with prices' do
    expect(pieshop.show_menu).to eq "item                price\nVegetable pie       2\nLamb pie            3\nSteak pie           3\nKangaroo pie        4\nDog pie             1\nMonkey pie          5\nWhale pie           6\n"
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'allows an order of multiple dishes to be placed' do
    pieshop.order('Vegetable pie', 4)
    pieshop.order('Whale pie', 3)
    pieshop.order('Dog pie')
    expect(pieshop.show_order).to eq "item                quantity\nVegetable pie       4\nWhale pie           3\nDog pie             1\n"
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'allows a customer to check the price matches their total' do
    pieshop.order('Vegetable pie', 2)
    pieshop.order('Steak pie', 3)
    pieshop.order('Monkey pie')
    expect(pieshop.check_total(18)).to eq true
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  xit 'allows a customer to have a text sent once order is complete' do
    pieshop.order('Dog pie', 2)
    pieshop.order('Steak pie', 3)
    pieshop.order('Dog pie')
    pieshop.check_total(12)
    expect(pieshop.complete_order).to have_attributes(error_code: 0)
  end

end
