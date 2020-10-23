require_relative '../lib/menu'

describe ListofDishes do
  it { is_expected.to respond_to(:see_list) }
  it { is_expected.to respond_to(:menu) }

  describe ".see_list" do
    it "prints menu" do
      expect { subject.see_list }.to output("1. Pierogi (dumplings), price: £7.95\n2. Bigos, price: £5.45\n3. Golonka (ham hock), price: £9.95\n4. Krokiety (croquettes), price: £8.45\n5. Mushroom Soup, price: £2.95\n6. Grilled Trout with mashed potatos, price: £11.95\n7. Gulasz stew, price: £13.95\n").to_stdout
    end
  end
end
