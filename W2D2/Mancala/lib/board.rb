class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    # 14 cups: 6 & 13 are stores
    @cups = Array.new(14) { Array.new }
    @name1 = name1
    @name2 = name2

    place_stones
  end

  def place_stones
    @cups.each_index do |idx|
      next if idx == 6 || idx == 13
      @cups[idx] = %i(stone stone stone stone)
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12 || @cups[start_pos].empty?
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones_to_drop = @cups[start_pos]
    @cups[start_pos] = []

    idx = start_pos
    until stones_to_drop.empty?
      idx += 1
      idx = 0 if idx > 13

      if idx == 6
        @cups[6] << stones_to_drop.pop if current_player_name == @name1
      elsif idx == 13
        @cups[13] << stones_to_drop.pop if current_player_name == @name2
      else
        @cups[idx] << stones_to_drop.pop
      end
    end

    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? { |cup| cup.empty? } ||
      @cups[7..12].all? { |cup| cup.empty? }
      false
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      :draw
    else
      if player1_count > player2_count
        @name1
      else
        @name2
      end
    end
  end
end
