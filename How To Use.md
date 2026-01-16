# How To Use
### Resolution
The Resolution controls how large the interval is between points. 

_*Note: Even if you choose a smaller region than the default (-2,-2,2,2), assign the resolution as if it is still the default; the code will scale it down proportionally to match the smaller region's spacing._ 
### Iterations
The Max iteration number sets a ceiling to how many iterations the program will loop until the point is considered to converge. 
  
_*Note: Keep in mind that the coloring enginge creates bins that size proportionally to the max iteration value. If your graph is mostly black, white, and some red, and you wish to include more colors, the max iteration value is too high, which makes it such that most points fall in the first bin, corresponding to black and red points._ 
### Size
The size input takes four numbers in the form: [x1,y1,x2,y2]. (x1,y1) describes the bottom-left coordinate and (x2,y2) describes the top-right coordinate. This allows the user to specify a smaller rectangle if they wish to print a zoomed in image.
  
_*Note: If left blank, the default region is the square with corners (-2,-2) and (2,2)._
