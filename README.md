# mandebrotSet-Arrays
Generate the Mandelbrot Set by giving inputs on the resolution, the max number of iterations, and the region of the complex plane on which you'd like to generate on. The program uses MATLAB and its arrays to store data of each corresponding point and printing it all at the end. This saves lots of time because the printing process is slow.

I have previously made the same program on Python, and made it such that it computes each point and prints each pixel individually. However, it took significantly longer because of the printing process. With the new method of storing information and printing only once, much time is saved. 

As an added bonus to using MATLAB, the final image is a vector on a coordinate plane, allowing the user to see the axes and the gradients, but also gives the exciting ability to zoom into the graph and notice the fractal nature of the Set (with the only limitation being the resolution set at the beginning). 
