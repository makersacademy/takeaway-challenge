module MenuLister

  def self.list(menu)
    list_hash = create_hash(menu)
  end

  private

  def self.create_hash(menu)
    Hash[(menu.dishes.map.with_index { |dish, idx| [(idx +1), dish] })]
  end

end
