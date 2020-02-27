require 'menu'
describe Menu do
  it { is_expected.to respond_to :list }

  it "returns list of food items with prices" do
    subject.instance_variable_set(:@menu, { "item" => 1 })
    expect { subject.list }.to output("item - £1\n").to_stdout
  end
end
