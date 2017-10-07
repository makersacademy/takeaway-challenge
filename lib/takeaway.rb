class Takeaway

  dishes = {
  chicken_bhuna: 4.25,
  pilau_rice: 2,
  peshwari_naan: 1.75,
  creamy_lentils: 3,
  onion_bhaaji: 2.75
  }

  def list_dishes_prices(dishes)
    list = dishes.map do |key, value|
     "#{key}, #{value}"
    end
    list
  end
end
