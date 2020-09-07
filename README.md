# Knights_Travails_Ruby
Given a standard 8 x 8 chessboard where each position is indicated in algebraic notation (with the lower left corner being a1), design a script that accepts two or more arguments.

The first argument indicates the starting position of the knight. The second argument indicates the ending position of the knight. Any additional arguments indicate positions that are forbidden to the knight.

Return an array indicating the shortest path that the knight must travel to get to the end position without landing on one of the forbidden squares. If there is no valid path to the destination return nil.

## Learning Goals
* Be able to implement PolyTreeNode to build a path from start to finish
* Know how to store and traverse a tree
* Know when and why to use Breadth First Search (BFS) versus Depth First Search (DFS)

### Phase 0: Description
In this project, I will create a class that will find the shortest path for a Chess Knight from a starting position to an end position. Both the start and end positions should be on a standard 8x8 chess board.

This pathfinder algorithm looks very similar to word chains!

I will have to first write a class ```KnightPathFinder``` that will initialize with a ```start_pos``` starting position.

### License Information

```
    <Knights Travails - Shortest Path for Chess Knight on 8x8 Board>
    Copyright (C) 2020  Mark Calvelo

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
```