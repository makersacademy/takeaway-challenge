

def basket_sum
    @basket = {hello: 4, fs: 32}
    # raise 'Basket is empty' if basket.empty?
    message = ''
    a = @basket.map {|item, qty| message << "#{item} x #{qty} = £ 2 "}
    *{a}
end

  basket_sum
