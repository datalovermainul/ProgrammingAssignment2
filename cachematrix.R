## Calculation if inverse of matrix is a costly Computation, so caching the 
## inverse of a matrix is better than to calculate it repeatedly, we will 
## write to functions here, one to create a special vector to set,get the vector
## and to get and set the inverse of the vector, and another to calculate the inverse
## of the vector created in the first function

## The following function creates a special vector which basically is a list
## of functions to set,get the vector and to get and set the inverse of the vector

makeCacheMatrix <- function(x = matrix()) {
            i <- NULL
            set <- function(y)
           {
               x <<-y
               i <<-NULL
            }

           get <-function() x

           setinverse <- function(inverse) i <<- inverse

           getinverse <- function() i
 
           list(set=set, get=get,
                 setinverse=setinverse, 
                  getinverse=getinverse)
            
}


## The following function is to to calculate the inverse of the vector created in the first function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
                }
          data <- x$get()
          i <- solve(data, ...)
          x$setinverse(i)
          i
}
