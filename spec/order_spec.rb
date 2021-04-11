require 'order'

describe Order do
  let(:menu_array)     { [{ dish: 'chiken', price: 5, available?: true },
                          { dish: 'beef', price: 5, available?: false },
                          { dish: 'turkey', price: 10, available?: true }
                        ]
                       }
  let(:visual_menu)    { "chiken:  5 pounds\nbeef:  5 pounds\nturkey:  10 pounds\n" }
  let(:menu_dbl)       { double("Menu", item: menu_array) }
  let(:subject)        { described_class.new(menu_dbl) }

  
  it { is_expected.to be_instance_of(Order) }
  it { is_expected.to respond_to(:show_menu) }
  it 'shows the menu' do
    subject = described_class.new
    expect { subject.show_menu }.to output(visual_menu).to_stdout
  end
  it { is_expected.to respond_to(:basket) }
   
  describe "#add_to_basket" do
    it { is_expected.to respond_to(:add_to_basket).with(2).arguments }

    it 'adds an item to basket' do
      subject.add_to_basket(menu_dbl.item[2])
      expect(subject.basket).to include({ dish: menu_dbl.item[2][:dish], price: menu_dbl.item[2][:price], portions: 1 })
    end

    it 'adds the price to total' do
      expect { subject.add_to_basket(menu_dbl.item[2]) }.to change { subject.calculator.total }.by(menu_dbl.item[2][:price])
    end

    it 'tells if the item is unavailable' do
      expect { subject.add_to_basket(menu_dbl.item[1]) }.to raise_error("Sorry, #{menu_dbl.item[1][:dish]} is out stock")
    end
  end 
  
  it 'shows the summary of the order' do
    message = "2x turkey 20 pounds\nTotal = 20 pounds\n"
    subject.add_to_basket(menu_dbl.item[2], 2)
    expect { subject.order_summary }.to output(message).to_stdout
  end
end
