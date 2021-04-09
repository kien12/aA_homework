#do this o(n^2) a nested loop
def sluggish_octopus(arr)
    longest = ''
    arr.each do |el|
        arr.each do |el2|
            if el.length > el2.length
                longest = el
            else
                longest = el2
            end
        end
    end
    longest
end

class Array

    def merge_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b}

        return self if self.length <= 1
        midpoint = self.length / 2
        splitting_left = self.take(midpoint)
        splitting_right = self.drop(midpoint)
        splitting_left.merge_sort(&prc)
        splitting_right.merge_sort(&prc)

        Array.merge(splitting_left, splitting_right, &prc)

    end

    def self.merge(left, right, &prc)
        merged = []

        until left.empty? || right.empty?
            case prc.call(left.first, right.first)
            when 1
                merged << right.shift        
            when 0
                merged << left.shift
            when -1
                merged << left.shift
            end
        end
        merged + left + right
    end
end
#nlogn
def dominate_octopus(arr)
    prc = Proc.new { |a, b| a.length <=> b.length }

    p arr.merge_sort(&prc).last
end

#linear O(n)
def clever_octopus(arr)
    longest_fish = ''

    arr.each { |fish| longest_fish = fish if fish.length > longest_fish.length}
    longest_fish
end

arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# p sluggish_octopus(arr)
# sortedlength = 
# dominate_octopus(arr)
# p clever_octopus(arr)

#O(n)
def slow_dance(string, tile_direction)

    tile_directions.each_with_index do |direction, i|
        return i if string == direction
    end
    nil
end
#O(1)
def fast_dance(string, new_tile_data_structure)
    new_tile_data_structure[string]
end

hash = {
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7,
}

p fast_dance('left-up', hash)
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]