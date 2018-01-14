require 'takeaway'
require 'order'

describe "Takeaway features" do
  it 'can place an order' do
    takeaway = Takeaway.new
    takeaway.add_to_cart("Pancakes")
    takeaway.add_to_cart("Waffles")
    takeaway.add_to_cart("French Toast")
    takeaway.remove_from_cart("Waffles")
    expect { takeaway.checkout }.to output(
      "Pancakes...£3.00\nFrench Toast...£4.00\nTotal...£7.00\nOrder placed at..." +
      "#{Time.now.strftime('%d-%m-%Y %H:%M:%S')}\n"
    ).to_stdout
  end
end
