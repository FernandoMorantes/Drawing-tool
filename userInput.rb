load 'command.rb'

class UserInput

  attr_reader :command

  def readCommand
    @input = gets.chomp.split(' ')
    validateInput ? @command = Command.new(instructionArray:@input) : @command = nil
  end

  def validateInput

    return false if @input.empty?
    return false if @input[0] != 'Q' && @input[0] != 'C' && @input[0] != 'L' && @input[0] != 'R' && @input[0] != 'B'

    if @input[0] == 'C'
      # right number of arguments
      return false if @input.size != 3
      # Check if the input command to create the canvas has positive integer arguments
      return false if !/\A\d+\z/.match(@input[1]) && @input[1].to_i < 1
      return false if !/\A\d+\z/.match(@input[2]) && @input[2].to_i < 1

    elsif @input[0] == 'L' || @input[0] == 'R'
      return false if @input.size != 5
      return false if !/\A\d+\z/.match(@input[1]) && @input[1].to_i < 1
      return false if !/\A\d+\z/.match(@input[2]) && @input[2].to_i < 1
      return false if !/\A\d+\z/.match(@input[3]) && @input[3].to_i < 1
      return false if !/\A\d+\z/.match(@input[4]) && @input[4].to_i < 1

    elsif @input[0] == 'B'
      return false if @input.size != 4
      return false if !/\A\d+\z/.match(@input[1]) && @input[1].to_i < 1
      return false if !/\A\d+\z/.match(@input[2]) && @input[2].to_i < 1
      return false if @input[3].length != 1

    end

    true
  end

end
