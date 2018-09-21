load 'userInput.rb'
load 'canvas.rb'

class DrwawingTool

  def run

    userInput = UserInput.new
    userInput.readCommand

    until userInput.command.commandType == 'Q' do

      if userInput.command.commandType == 'C'

        canvas = Canvas.new row_size:userInput.command.row_size, column_size: userInput.command.column_size
        canvas.showCanvas

      elsif userInput.command.commandType == 'L' && !canvas.nil?

        canvas.drawLine x1:userInput.command.x1, y1:userInput.command.y1, x2:userInput.command.x2, y2:userInput.command.y2
        canvas.showCanvas

      elsif userInput.command.commandType == 'R' && !canvas.nil?

        canvas.drawRectangle x1:userInput.command.x1, y1:userInput.command.y1, x2:userInput.command.x2, y2:userInput.command.y2
        canvas.showCanvas

      elsif userInput.command.commandType == 'B' && !canvas.nil? && !userInput.command.color.nil?

        canvas.fillBucket x:userInput.command.x, y:userInput.command.y, color:userInput.command.color
        canvas.showCanvas

      end

      userInput.readCommand
    end

  end
end

drwawingTool = DrwawingTool.new
drwawingTool.run
