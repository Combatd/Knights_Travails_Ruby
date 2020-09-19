require_relative 'polytreenode'

class KnightPathFinder 
    # setter for root_node instance variable
    attr_accessor :root_node, :considered_positions
    # Matrix represents 8 x 8 grid
    MOVES = [[1,2], [2,1], [-1, 2], [1, -2], [-2, 1], [2, -1], [-2, -1], [-1, -2]]
    
    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]

        # build_move_tree will be needed here
    end

    def self.valid_moves(pos)
        row = pos.first # first element of pos
        col = pos.last # second element of pos

        new_moves = MOVES.map do |move|
            if (row + move.first).between?(0, 7) && (col + move.last).between?(0, 7) # if one of 8 valid moves
                [row + move.first, col + move.last] # add the move to the current row and column of pos
            end
        end
        new_moves.reject { |ele| ele.nil? } # filter nil values from new_moves and return
    end

end