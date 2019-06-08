require 'menu'

describe Menu do
  it 'has a list of items by default' do
    expect(subject.food).not_to be_empty
  end

  it "can list available dishes" do
    expect { subject.show }.to output(a_string_including("* Big Mac - £5.99")).to_stdout
  end

  it 'can return a chosen dish, price & quantity' do
    expect(subject.choose_items("Big Mac", 2)).to eq({ item: "Big Mac", price: 5.99, quantity: 2 })
  end
end
