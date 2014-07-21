node_diagram
============

A small program to manage node_diagrams.


The prompt:

-Reads and interprests text input from a file. 
-Builds each node and a node diagram.

Two objects:

-Diagram:
 -Initialized with the input's file path, this msut be in the form of links in the form of 2 letters and a number, where the first letter is the origin node, the second is the destination node, and the number is the value of the link. Each link is separated by a coma and a space or a line break. i.e: "XY5, YZ3, ZX10" 
 #path_value: takes an array of nodes and returns the total value of its links.
 #find_paths: takes 2 nodes, an integer and an optional boolean as input and returns the number of valid paths between the two nodes withing a maximun of jumps equivalent of the number passed in.  If the optional input is "true" it will look for the exact number of jumps. 
 #min_path: takes 2 nodes as input and returns the path with the smallest value between them. 
 #paths_under_value: takes 2 nodes and an integer as input and returns the number of path with values lower than the integer passed. 
