# Big O-ctopus and Biggest Fish

# A Very Hungry Octopus wants to eat the longest fish in an
# array of fish.
#
fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
'ffiiiiisshh','fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"
#
# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish
# lengths to all other fish lengths


def sluggish_octopus(fish)
  fish.each_with_index do |outer_fishy, o_idx|
    biggest = true

    fish.each_with_index do |inner_fishy, i_idx|
      next if o_idx == i_idx
      biggest = false if inner_fishy.length > outer_fishy.length
    end

    return outer_fishy if biggest
  end
end


# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting
# algorithm that runs in O(n log n) in the Sorting Demo. Remember that
# Big O is classified by the dominant term.
class Array

  def merge_sort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new { |a, b| a <=> b }

    mid = self.length / 2
    left = take(mid).merge_sort(&prc)
    right = drop(mid).merge_sort(&prc)

    merge(left, right, &prc)
  end

  private
  def merge(left, right, &prc)
    result = []

    until left.empty? || right.empty?
      case prc.call(left[0], right[0])
      when -1
        result << left.shift
      when 0
        result << left.shift
      when 1
        result << right.shift
      end

    end
    result + left + right
  end
end

def dominant_octopus(fish)
  fish_by_size = fish.merge_sort { |a, b| a.length <=> b.length }
  fish_by_size.last

end



# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the
# longest fish that you have found so far while stepping through the
# array only once.


def clever_octopus(fish)
  biggest_fish = fish[0]

  fish.each do |fishy|
    if fishy.length > biggest_fish.length
      biggest_fish = fish
    end
  end

  biggest_fish[-1]
end

# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game
# has tiles in the following directions:
tiles_array = ["up", "right-up", "right", "right-down", "down",
"left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her
# corresponding tentacle. We can assume that the octopus's eight
# tentacles are numbered and correspond to the tile direction indices.

# Slow Dance
# Given a tile direction, iterate through a tiles array to return the
# tentacle number (tile index) the octopus must move.
# This should take O(n) time.
# slow_dance("up", tiles_array)
# > 0
# slow_dance("right-down", tiles_array)
# > 3

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster.
# Use a different data structure and write a new function so that you
# can access the tentacle number in O(1) time.
# fast_dance("up", new_tiles_data_structure)
# > 0
# fast_dance("right-down", new_tiles_data_structure)
# > 3

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right"=> 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end

puts "Tests"
puts "Sluggish Octopus----------------------------------------------"
puts sluggish_octopus(fish) == "fiiiissshhhhhh"
puts ""

puts "Dominant Octopus----------------------------------------------"
puts dominant_octopus(fish) == "fiiiissshhhhhh"
puts ""

puts "Clever Octopus----------------------------------------------"
puts clever_octopus(fish) == "fiiiissshhhhhh"
puts ""
