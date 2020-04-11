def solution(n, s, t)
    raise "invalid n: #{n}" if n > 26 || n < 1
  
    ships = parse_ships(s)
    hits = parse_hits(t)
  
    sunken_cnt = 0
    hit_cnt = 0
  
    ships.each do |ship|
      current_hit  = ship.test_hits(hits)
      if current_hit > 0
        if current_hit == ship.dimension
          sunken_cnt = sunken_cnt + 1 
        else
          hit_cnt = hit_cnt + 1
        end
      end
    end
  
    return "#{sunken_cnt},#{hit_cnt}"
  end
  
  class Ship
    attr_accessor :top_left, :bottom_right
  
    def initialize(top_left, bottom_right)
      @top_left = top_left
      @bottom_right = bottom_right
    end
  
    def test_hits(hits)
      hit_cnt = 0
      hits.each do |hit|
        if hit.eg(top_left) && bottom_right.eg(hit)
          hit_cnt = hit_cnt + 1
        end
      end
      hit_cnt
    end
  
    def dimension
      ((bottom_right.x - top_left.x).abs + 1 ) * ((bottom_right.y - top_left.y).abs + 1)
    end
  end
  
  class Point
    attr_accessor :x, :y
  
    def initialize(point_str)
      @x = point_str[0..-2].to_i
      @y = point_str[-1].ord - 'A'.ord + 1
    end
  
    def eg(other)
      x >= other.x && y >= other.y
    end
  end
  
  def parse_ships(ships_str)
    ships = []
    ships_str.split(',').each do |ship_str|
      coords = ship_str.split(' ')
      raise "invalid ship string: #{ships_str}" if coords.size != 2
      ships << Ship.new(Point.new(coords[0]), Point.new(coords[1]))
    end
    ships
  end
  
  def parse_hits(hits_str)
    hits = []
    hits_str.split(' ').each do |hit_str|
      hits << Point.new(hit_str)
    end
    hits
  end