
# O(n)
def clever_octopus(arr_of_fish)
	biggest_fish = arr_of_fish.first
	arr_of_fish.each do |fish|
		biggest_fish = fish if fish.length > biggest_fish.length
	end
	biggest_fish
end

#O(n^2)
def sluggish_octopus(arr_of_fish)
	biggest_fish = ""
	arr_of_fish.each_with_index do |fish, i|
		biggest_fish ||= fish
		arr_of_fish.each_with_index do |other_fish, j|
			next if j < i
			biggest_fish = other_fish if other_fish.length > biggest_fish.length
		end
	end
end

#O(n log n)
def dominant_octopus(arr_of_fish)
	merge_sort(arr_of_fish).first
end


def merge_sort (array, &prc)
  return array if array.length <= 1

  mid_idx = array.length / 2
  merge(
    merge_sort(array.take(mid_idx), &prc),
    merge_sort(array.drop(mid_idx), &prc),
    &prc
  )
end


def merge(left, right, &prc)
  merged_array = []
  prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      merged_array << left.shift
    when 0
      merged_array << left.shift
    when 1
      merged_array << right.shift
    end
  end

  merged_array + left + right
end

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

TILES = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}.freeze

def fast_dance(direction)
  TILES[direction]
end
