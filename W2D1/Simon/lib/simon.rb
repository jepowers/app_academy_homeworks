class Simon
  require 'byebug'
# The specs should guide you as to what each method does. One important
# thing to note is that it is generally impractical to test console
# user input, so the specs don't test require_sequence. The goal of
# require_sequence is to prompt the user to repeat back the new
# sequence that was just shown to them, one color at a time. If they give
# an incorrect color, it should immediately set @game_over to be true.

  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    initialize

    until @game_over
      take_turn
      system("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color

    "Watch the following sequence carefully".timed_message(2)

    seq.each do |color|
      "".timed_message(0.5)
      color.timed_message(1)
    end
  end

  def require_sequence
    puts "Please enter the sequence in order.\n\n"

    @seq.each do |val|
      response = gets.chomp.strip

      if response != val
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq += [COLORS.shuffle.first]
  end

  def round_success_message
    "You got it! Here comes the next round!".timed_message(3)
  end

  def game_over_message
    puts "Oh no! That wasn't correct. You've lost. :-("
    puts ""
    puts "You were able to keep track for #{sequence_length} turns!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def correct_guess?(response_arr)
    response_arr.each_index do |idx|
      return false if response_arr[idx] != @seq[idx]
    end
    true
  end
end

class String
  def timed_message(seconds)
    puts self
    sleep(seconds)
    system("clear")
  end
end
