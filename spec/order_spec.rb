require 'order'

describe Order do
  # send_text instance double
  let(:send_txt_double) {double("send_text_api")}

  # menu instance
  let(:menu_double) {double("menu_double", :menu => {a: 10, b: 20, c: 30})}

  # What has been ordered: key=dish name, value=quantity
  let(:order_list) {{a: 5, b: 2}}

  subject{described_class.new(Time.now, order_list, 3600, send_txt_double)}


  describe '#create_msg' do
    it 'Send correct msg to send text api' do
      # Thank you! Your order was placed and will be deliverd before XX
      order_time = Time.now
      delivery_time = order_time + 3600
      new_order = Order.new(order_time, order_list, 3600, send_txt_double)
      message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
      expect(send_txt_double).to receive(:send_txt).with(message)
      new_order.send_txt_confirm
    end
  end

  describe '#total_price' do
    it 'return the total cost' do
      expect(subject.total_price(menu_double)).to eq(90)
    end
  end
end
