load 'command.rb'

class UserInput

  attr_reader :command

  def initialize
    @command = Command.new instructionArray:[]
  end

  def readCommand
    @command = Command.new instructionArray:gets.chomp.split(' ')
  end

  def validateData

  end

end
