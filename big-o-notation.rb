# O(1) Same run time/space regardless of input

def first_element_nil?(array)
  raise "Invalid input" unless array.is_a? Array
  array[0].nil?
end

# O(n) performance gros linearly, proportion to data set.

def match(array_of_strings, value = 'foobar')
  raise "Invalid input" unless array_of_strings.is_a? Array
  array_of_strings.each do |element|
    return true if element == value
  end
end

#O(n^2) performance is proportional to the square of the input size.

def double_iteration(array_of_strings)
  raise "Invalid input" unless array_of_strings.is_a? Array
  array_of_strings.each do |string|
    string.split('').each { |char|  return true if char.nil? }
  end
end

#O(2^n) Grows double with each adition.

def fibonacci(n)
  return n if n <= 1
  fibonacci(n-2) + fibonacci(n-1)
end

########################################################

def tester(method, argument)
  argument = send(argument) if argument.is_a? Symbol
  ts = Time.now
  send(method, argument)
  Time.now - ts
end

def multi_tester(attempts, method, argument)
  p "Testing #{method.to_s}"
  results = []
  attempts.times do
    time = tester(method, argument)
    results << time
  end
  p results
  p results.uniq.length
  nil
end

def random_length_array
  (1..rand(9..999)).to_a
end

def random_array_of_strings
  Array.new(rand(9..999),'foobar')
end
