class Order

    def make_order (a, *others)
        arr = [] 
         others.each do |i|
            arr << i
         end
        arr.insert(0, a)
    end
end