class Command

  attr_reader :commandType, :row_size, :column_size, :x, :y, :color, :x1, :y1, :x2, :y2

  def initialize instructionArray:

    @commandType = instructionArray[0]
    if instructionArray.size == 3
      @row_size = instructionArray[2].to_i
      @column_size = instructionArray[1].to_i

    elsif instructionArray.size == 4
      @x = instructionArray[1].to_i - 1
      @y = instructionArray[2].to_i - 1
      @color = instructionArray[3].to_s

    else
      @x1 = instructionArray[1].to_i - 1
      @y1 = instructionArray[2].to_i - 1
      @x2 = instructionArray[3].to_i - 1
      @y2 = instructionArray[4].to_i - 1

    end

  end
end
