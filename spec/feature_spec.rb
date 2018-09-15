describe 'initialize' do
  it 'intializes the menu' do
    expect(takeaway.customer_order).to eq([])
  end
end

describe 'show_menu' do
  it 'shows the dishes with prices' do
    takeaway.show_menu
    expect(menu_obj).to receive(:show_menu)
    menu_obj.show_menu
    #allow(menu_obj).to receive(:show_menu).and_return('list of dishes with prices')
    #list_of_dishes = ['pasta', £20, 'Non-veg main mean']
    #expect(takeaway.show_menu).to eq(list_of_dishes)
  end
end

describe '#ready_to_order' do
  it 'allows customers to select one of the available dishes' do
    takeaway.show_menu
    expect(menu_obj).to receive(:show_menu)
    menu_obj.show_menu
    takeaway.ready_to_order
    expect(menu_obj).to receive(:select_dishes)
    menu_obj.select_dishes
    expect { takeaway.ready_to_order }.to change { takeaway.customer_order }
    takeaway.customer_order.each { |hash| expect(hash.keys).to contain_exactly(*hash_keys)}
    expect(takeaway).to receive(:verify_order).with(takeaway.customer_order)#ordered_dishes
    takeaway.verify_order(takeaway.customer_order)

    #menu_obj = Menu.new()
    # takeaway1 = Takeaway.new(menu_obj, sms_obj)
    # allow(menu_obj).to receive(:show_menu)
    # takeaway1.show_menu
    # allow(menu_obj).to receive(:select_dishes)
    # takeaway1.ready_to_order
    #
    # menu_obj.select_dishes
    # expect { takeaway1.ready_to_order }.to change { takeaway1.customer_order }
    # takeaway1.customer_order.each { |hash| expect(hash.keys).to contain_exactly(*hash_keys)}
    # expect(takeaway1).to receive(:verify_order).with(takeaway1.customer_order)#ordered_dishes
    # takeaway1.verify_order(takeaway1.customer_order)
    # #allow(sms_obj).to receive(:show_menu)
    # allow(sms_obj).to receive(:send_message).and_return("Hey friend!, You just sent an SMS from Ruby!")
    # #sms_obj.send_message
  end
end

describe '#verify_order' do
  it 'verifies the total matches the sum of the various dishes in my order' do


    #menu_obj = Menu.new
    # takeaway1 = Takeaway.new(menu_obj, sms_obj)
    # #takeaway1.show_menu
    # takeaway1.ready_to_order

    takeaway.show_menu
    expect(menu_obj).to receive(:show_menu)
    takeaway.show_menu
    takeaway.ready_to_order
    expect(menu_obj).to receive(:select_dishes)
    menu_obj.select_dishes
    expect { takeaway.ready_to_order }.to change { takeaway.customer_order }
    takeaway.customer_order.each { |hash| expect(hash.keys).to contain_exactly(*hash_keys)}
    expect(takeaway).to receive(:verify_order).with(takeaway.customer_order)#ordered_dishes
    takeaway.verify_order(takeaway.customer_order)

    #takeaway.verify_order(takeaway.customer_order)
    #allow(sms_obj).to receive(:show_menu)
    #allow(sms_obj).to receive(:send_message).and_return("Hey friend!, You just sent an SMS from Ruby!")
    #sms_obj.send_message
    expect { (takeaway.total) != takeaway.customer_order.map { |item| item[:price] * item[:quantity]}.reduce(:+)}.to raise_error 'Sum does not match the total sum of the dishes ordered.'
    # expect(sms_obj).to receive(:send_message).and_return("Hey friend!, You just sent an SMS from Ruby!")
    # sms_obj.send_message
    expect(takeaway.total).to eq(takeaway.customer_order.map { |item| item[:price] * item[:quantity]}.reduce(:+))
  end
end

# # describe 'order' do
# #   it 'lets the customer select some number of several available dishes' do
#     takeaway.show_menu
#     takeaway.order(cust_order)
#     expect { takeaway.order(cust_order)}.to raise_error
#     if cust_order.not_include(takeaway.menu[:dish])
#   end
# end
end
