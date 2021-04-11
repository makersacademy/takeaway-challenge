require 'order'

describe Order do
  let(:menu_list)      { [
                          { dish: 'biryani', price: 10, available?: true }, 
                          { dish: 'chicken', price: 15, available?: true },
                          { dish: 'lamb', price: 20, available?: false },
                          { dish: 'duck', price: 25, available?: false },
                          ] 
                        }
  let(:menu)           { double :menu, menu_list: menu_list }
  let(:subject)        { described_class.new(menu) }
  

  it 'has total order amount' do
    expect(subject.total_order_amount).to eq 0
  end 

  it 'has a basket for selected dishes' do
    expect(subject.basket).to eq []
  end 

  describe '#select_dish' do
    it 'can select from a number of available dishes' do
      subject.select_dish('biryani', 1)
      expect(subject.basket).to include(menu.menu_list[0])
    end

    it 'can add multiple portions of one dish to the basket' do
      subject.select_dish('biryani', 2)
      expect(subject.basket).to eq([menu.menu_list[0], menu.menu_list[0]])
      p subject.basket
    end

    it 'raises an error if selected dish is not available' do
      expect { subject.select_dish('duck', 1) }.to raise_error("duck is not available to order")
    end
  end

  describe '#calculate_order_value' do
    it 'calculates the total order value' do
      subject.select_dish('biryani', 3)
      subject.select_dish('chicken', 2)
      subject.calculate_order_value
      expect(subject.total_order_amount).to eq 60
    end
  end



end
