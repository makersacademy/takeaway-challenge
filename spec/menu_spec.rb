require 'menu'

describe Menu do
  subject (:menu) { Menu.new }
  
  let (:dishes) do
    <<~MENU
      1. Beef burger: 14
      2. Chicken burger: 12
      3. Hot dog: 11
      4. Fries: 4
      5. Soft drink: 3
      6. Milkshake: 5
    MENU
  end

  describe '#view' do
    it { is_expected.to respond_to(:view) }

    it 'shows a menu' do
      allow(menu).to receive(:view) { "Menu" }
      expect(menu.view).to eq "Menu"
    end

    specify { expect { menu.view }.to output(dishes).to_stdout }
  end

  describe '#select' do
    it { is_expected.to respond_to(:select).with_unlimited_arguments }

    let (:order) do 
      [{ name: "Beef burger", price: 14 },
      { name: "Fries", price: 4 },
      { name: "Milkshake", price: 5 }]
    end

    it 'adds a dish to the order' do
      menu.select(1)
      expect(menu.order.order).to eq([{ name: "Beef burger", price: 14 }])
    end

    it 'adds multiple dishes to the order' do
      menu.select(1, 4, 6)
      expect(menu.order.order).to eq(order)
    end
  end
end
