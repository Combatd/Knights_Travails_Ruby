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



end