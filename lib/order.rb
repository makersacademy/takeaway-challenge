Order = Struct.new(:customer_name, :customer_tel, :items) do
  def generate_price_array
    items.map { |i| @menu.list_items[i] }
  end
end
