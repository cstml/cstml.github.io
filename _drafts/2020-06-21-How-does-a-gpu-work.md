---
layout: post
---

# Graphics Pipeline 
What does the GPU do?

1. Takes the data 

2. Processes the data into points (Vertex Shader) 
3. Connect the points with lines and fills in the resulting triangles (Rasterisation)
4. Processes the resulting data, and assigns colour to each pixel of the raster (Fragment Shader - in openGL lingo)
5. Outputs all of the above data 

The gpu does all the processes from above in parallel. You can imagine a big fishing net going through the water. Each node of the fishing net represents the data and the water represents the processes that are applied to it. If the net was to slap on a flat square, that would be the parallel data output.

# Other types of Shaders

  

| Shader   | What it does                |
| -------- | --------------------------- |
| Vertex   | Processes data into points  |
| Fragment | Processes data into colours |
| Geometry |                             |

# Clarifications

| Term   | What it means                                                |
| ------ | ------------------------------------------------------------ |
| shader | A **shader** is a piece of code that tells the GPU how to interpret the data that it is receiving. The GPU will use the **shader** as its guide  to do parallel processes to the information received. |
| GPU    | Graphi Processing Unit. Is a chipset that allows the user to do multiple calculations in parallel. |
| handle | within the context of openGL a handle is a variable that lets the program know where it is. `GLuint` is a openGL specific `unsigned integer` (your good ol' `std::size_t` equivalent) |
|        |                                                              |



# Resources
[A great video breaking it down](https://www.youtube.com/watch?v=bgckX62f4EA)