load 'userInput.rb'
load 'canvas.rb'

class DrwawingTool

  def run

    userInput = UserInput.new

    begin
      userInput.readCommand

      if !userInput.command.nil?
        if userInput.command.commandType == 'C'

          canvas = Canvas.new row_size:userInput.command.row_size, column_size: userInput.command.column_size
          canvas.drawCanvas

        elsif userInput.command.commandType == 'L' && !canvas.nil?

          canvas.drawLine x1:userInput.command.x1, y1:userInput.command.y1, x2:userInput.command.x2, y2:userInput.command.y2
          canvas.drawCanvas

        elsif userInput.command.commandType == 'R' && !canvas.nil?

          canvas.drawRectangle x1:userInput.command.x1, y1:userInput.command.y1, x2:userInput.command.x2, y2:userInput.command.y2
          canvas.drawCanvas

        elsif userInput.command.commandType == 'B' && !canvas.nil?

          canvas.fillBucket x:userInput.command.x, y:userInput.command.y, color:userInput.command.color
          canvas.drawCanvas

        end
      else
        puts "\ncomando no valido\n"
      end

    end while  userInput.command.nil? || userInput.command.commandType != 'Q'

  end
end

drwawingTool = DrwawingTool.new
drwawingTool.run
