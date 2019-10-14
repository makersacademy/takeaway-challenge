require 'customer'

describe Customer do

  receipt = '''Receipt
-----------
burger 2 * 5.50 11.00
chips 1 * 1.50 1.50
Total = 12.50
'''

  it 'can get a list of menu items and their prices' do
    expect(subject.list_of_menu_items).to include('burger: 5.50')
  end

  it 'outputs list' do
    expect{subject.print_list}.to output.to_stdout
  end

  it 'returns items list when adding an item' do
    expect(subject.add_item_to_order('burger')[0]).to eq("burger 1 * 5.50 5.50")
  end

  it 'returns a receipt with totals' do
    2.times{subject.add_item_to_order('burger')}
    expect(subject.receipt[0]).to include('11.00')
  end

  it 'outputs a receipt' do
    2.times{subject.add_item_to_order('burger')}
    subject.add_item_to_order('chips')
    expect{subject.print_receipt}.to output(receipt).to_stdout
  end

end
