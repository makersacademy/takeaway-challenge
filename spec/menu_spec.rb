require 'menu'

describe Menu do
  subject(:menu_obj) { described_class.new }
  let(:hash_keys){ [:dish, :price, :quantity]}
  it { is_expected.to respond_to :menu}

  describe 'show_menu' do
    it 'shows the menu' do
      expect(menu_obj.show_menu).to eq(menu_obj.menu)
    end
  end

  describe 'select_dishes' do
    it 'allows customers to select one of the available dishes' do
      menu_obj.show_menu
      expect(menu_obj.select_dishes)
      expect { menu_obj.select_dishes }.to change { menu_obj.ordered_dishes }
      #expect(menu_obj.ordered_dishes).to include(h.keys{dish:, price:, quantity:})
      menu_obj.ordered_dishes.each { |hash| expect(hash.keys).to contain_exactly(*hash_keys)}

      # menu_obj.menu = expect(
      #   menu_obj.ordered_dishes.all? { |k,v|
      #         v == (menu_obj.menu)[k])
      #         }
      #         ).to be true
      # to match(menu_obj.menu)

      #values = [""]
      # values = takeaway.menu.each do |item|
      #  item.each do |k, v|
      #    values.push(k, v)
          #item.k = :quantity
      #   end

      # end
      # end
      # (takeaway.menu).each do |hash|
      #   expect(hash.values).to include(values)
      # end

      #hash2.values_at(*hash1.keys) == hash1.values
      # expect(takeaway.ordered_dishes).not_include(takeaway.menu[:dish])
      # .to raise_err
      # if cust_order.not_include(takeaway.menu[:dish])
    end
  end
  # let(:takeaway) { Takeaway.new }
  # it 'shows the dishes with prices' do
  #   expect(takeaway.show_menu).to eq(takeaway.menu)
  # end
end
