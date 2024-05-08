=begin
    Write a Program to take two hashses as input and check for the following:
    Keys in Hash #1 is a subset of Keys in Hash #2
    Values in Hash #1 is a subset of Values in Hash #2
    Case #1: Positive Scenario
    Input:
    Hash #1: { a: 1, b: 2, c: 3 }
    Hash #2: { a: 1 }
    Output:
    Keys of Hash #2 are a subset of Keys of Hash #1
    Values of Hash #2 are a subset of Values of Hash #1
    Case #2: Negative Scenario
    Input:
    Hash #1: { a: 1, b: 2, c: 3 }
    Hash #2: { d: 1 }
    Output:
    Keys of Hash #2 are NOT a subset of Keys of Hash #1
    Values of Hash #2 are NOT a subset of Values of Hash #1
    Case #3: Negative Scenario
    Input:
    Hash #1: { a: 1, b: 2, c: 3 }
    Hash #2: { a: 5, b: 6 }
    Output:
    Keys of Hash #2 are a subset of Keys of Hash #1
    Values of Hash #2 are NOT a subset of Values of Hash #1
=end


def hash_subset(hash1, hash2)

    # checking if keys of hash2 are a subset of keys of hash1
    hash2.each do |key, value|
        if hash1.include?(key) 
            puts "Keys of Hash #2 are a subset of Keys of Hash #1"
            if hash1[key] == value
                puts "Values of Hash #2 are a subset of Values of Hash #1"
            else    
                puts "Values of Hash #2 are NOT a subset of Values of Hash #1"
            end
        else
            puts "Keys of Hash #2 are NOT a subset of Keys of Hash #1"
            puts "Values of Hash #2 are NOT a subset of Values of Hash #1"
        end
    end
end


# spliting the input string by space and convert it to an array of arrays with each sub-array containing 2 elements (key and value)
# converting the array of arrays to a hash
puts "Enter elements for Hash 1:"
hash1 = Hash[gets.chomp.split(" ").each_slice(2).to_a]

puts "Enter elements for Hash 2:"
hash2 = Hash[gets.chomp.split(" ").each_slice(2).to_a]

hash_subset(hash1, hash2)