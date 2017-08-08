require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = place_stones
  end

  def place_stones
    cups = Array.new(14)
    cups.dup.each_index { |idx| idx == 6 || idx == 13 ? cups[idx] = [] : cups[idx] = [:stone, :stone, :stone, :stone] }
    cups
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, 14)
  end

  def make_move(start_pos, current_player_name)
    my_stones = @cups[start_pos].length
    @cups[start_pos] = []
    idx = start_pos
    until my_stones == 0
      idx += 1
      idx = 0 if idx > 13
      if idx == 6
        if current_player_name == @name1
          @cups[6] << :stone
          my_stones -= 1
        end
      elsif idx == 13
        if current_player_name == @name2
          @cups[13] << :stone
          my_stones -= 1
        end
      elsif idx != 6 && idx != 13
        @cups[idx] << :stone
        my_stones -= 1
      end
    end
    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].count == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups.take(6).all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      :draw
    else
      player1_count > player2_count ? @name1 : @name2
    end
  end
end
