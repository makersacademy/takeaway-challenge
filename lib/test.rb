arr = [{:a=>5, :b=>1, :c=>20}, {:a=>20, :b=>2, :c=>30}]
a = arr.inject(0) {|sum, hash| sum + hash[:a]} #=> 30

puts a
