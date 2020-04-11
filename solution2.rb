def solution(u, l, c)
    row1 = Row.new
    row2 = Row.new
    c.each do |val|
      if val == 2
        row1.on
        row2.on
      elsif val == 0
        row1.off
        row2.off
      elsif val == 1
        if row1.total < u
          row1.on
          row2.off
        elsif row2.total < l
          row1.off
          row2.on
        else
          return 'IMPOSSIBLE'
        end
      else
        raise "invalid c: #{c}"
      end
    end
  
    return 'IMPOSSIBLE' if row1.total != u || row2.total != l
  
    "#{row1.cell_str},#{row2.cell_str}"
  end
  
  class Row
    attr_accessor :cells, :total
  
    def initialize
      @cells = []
      @total = 0
    end
  
    def on
      @cells << 1
      @total = @total + 1
    end
  
    def off
      @cells << 0
    end
  
    def cell_str
      @cells.join
    end
  end
  
  p solution(3, 2, [2, 1, 1, 0, 1])
  p solution(2, 3, [0, 0, 1, 1, 2])
  p solution(2, 2, [2, 0, 2, 0])