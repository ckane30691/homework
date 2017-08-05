class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    sleep(rand(2..6))
    system('clear')
    system('cls')
    require_sequence
    round_success_message unless @game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    puts @seq
  end

  def require_sequence
    puts "Ok, now enter the sequence back"
    user_repeat = gets.chomp.split
    @game_over = true unless user_repeat == @seq
  end

  def add_random_color
    @seq << COLORS[rand(4)]
  end

  def round_success_message
    puts "You got it!"
  end

  def game_over_message
    puts "Incorrect Pattern You lose!"
  end

  def reset_game
    puts "Play Again? (y,n)"
    response = gets.chomp
    if response == "y"
      @seq = []
      @sequence_length = 1
      @game_over = false
      play
    end
    nil
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
