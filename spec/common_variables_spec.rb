shared_context "common takeaway" do
  #dishes in menu
  let(:dish_one) {{ dish: "soup", price: 1.99, available: 8 }}
  let(:dish_two) {{ dish: "chips", price: 0.50, available: 20 }}
  let(:dish_three) {{ dish: "ramen", price: 0.90, available: 30 }}
  let(:list) { [dish_one, dish_two, dish_three] }

  #dummy basket
  let(:dish_two_basket) {{ dish: "chips", price: 0.5, available: 3, ordered: 5 }}
  let(:dish_three_basket) {{ dish: "ramen", price: 0.9, available: 2, ordered: 10 }}
  let(:basket) { [dish_two_basket, dish_three_basket] }

  #doubles for Takeaway class
  let(:menu_klass) { double("menu", list: list, print: "print menu", dish_exists?: true, dish_available?: true, dish_price: 0.6) }
  let(:basket_klass) { double("basket", print: "print basket", add: "add desired dish", details: [{dish: "soup", price: 1.99, ordered: 2}], empty: "") }
  let(:checkout_klass) { double("checkout", order_confirmation: false, send_confirmation_message: "") }

  #initialize subject with doubles
  subject{described_class.new({ name: "Dishoom", menu: menu_klass, basket: basket_klass, checkout: checkout_klass })}
end

shared_context "common menu" do
  let(:dish_one) {{ dish: "soup", price: 1.99, available: 8 }}
  let(:dish_two) {{ dish: "chips", price: 0.5, available: 20 }}
  let(:dish_three) {{ dish: "ramen", price: 0.9, available: 30 }}
  let(:list) {[dish_one, dish_two, dish_three]}
  subject{ described_class.new() }
end
