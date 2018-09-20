class Canvas
  def initialize row_size:, column_size:
    @row_size = row_size
    @column_size = column_size
    @canvas = Array.new(row_size) { Array.new(column_size, ' ') }
  end

  def showCanvas
    (@column_size+2).times {print '-'}
    puts "\n"
    @canvas.each { |row| puts "|#{row.join('')}|"}
    (@column_size+2).times {print '-'}
    puts "\n"
  end

  def drawLine x1: ,y1:, x2:, y2:

    @canvas.each_with_index do |row, i|

      if i.between?([y1, y2].min, [y1, y2].max)
        row.each_with_index do |element, j|
          @canvas[i][j] = 'x' if j.between?([x1, x2].min, [x1, x2].max)
        end
      end

    end

  end

  def drawRectangle x1: ,y1:, x2:, y2:

    drawLine(x1:x1, y1:y1, x2:x1, y2:y2)
    drawLine(x1:x2, y1:y1, x2:x2, y2:y2)
    drawLine(x1:x1, y1:y1, x2:x2, y2:y1)
    drawLine(x1:x1, y1:y2, x2:x2, y2:y2)

  end

  def fillBucket x:, y:, color:

    if x.between?(0, @column_size-1) && y.between?(0, @row_size-1) && @canvas[y][x] != 'x' && @canvas[y][x] != color.to_s
      @canvas[y][x] = color.to_s
      fillBucket x:(x+1), y:y, color:color
      fillBucket x:(x+1), y:(y+1), color:color
      fillBucket x:x, y:(y+1), color:color
      fillBucket x:(x-1), y:(y+1), color:color
      fillBucket x:(x-1), y:y, color:color
      fillBucket x:(x-1), y:(y-1), color:color
      fillBucket x:x, y:(y-1), color:color
      fillBucket x:(x+1), y:(y-1), color:color
    end

  end
end

instruction = gets.chomp

until instruction == 'Q'do

  instruction = instruction.to_s.split(' ')

  if instruction[0] == 'C'

    canvas = Canvas.new row_size:instruction[2].to_i, column_size: instruction[1].to_i
    canvas.showCanvas

  elsif instruction[0] == 'L' && !canvas.nil?

    canvas.drawLine x1:(instruction[1].to_i-1), y1:(instruction[2].to_i-1), x2:(instruction[3].to_i-1), y2:(instruction[4].to_i-1)
    canvas.showCanvas

  elsif instruction[0] == 'R' && !canvas.nil?

    canvas.drawRectangle x1:(instruction[1].to_i-1), y1:(instruction[2].to_i-1), x2:(instruction[3].to_i-1), y2:(instruction[4].to_i-1)
    canvas.showCanvas

  elsif instruction[0] == 'B' && !canvas.nil? && !instruction[3].nil?

    canvas.fillBucket x:(instruction[1].to_i-1), y:(instruction[2].to_i-1), color:instruction[3].to_s
    canvas.showCanvas

  end

  instruction = gets.chomp

end
