## This program calculate and caches the inverse of a square matrix

## Function accepts a matrix as an argument
## Four functions are defined within it, one each to
## *Assign a matrix
## *Retrieve the assigned matrix
## *Make a call to calculate the inverse
## *Make a call to retrieve the inverse 

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(m) {
        x <- m
        inverse <- NULL
    }
    
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This is the function from which the previous functions are called.
## It takes an instance of makeCacheMatrix() as argument.
## The inverse is returned if it already exists in cache via getinverse().
## Otherwise the inverse can be stored in cache by calling setinverse() without arguments.

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if (!is.null(i)) {
        message("Retrieving inverse of matrix...\n")
        return(i)
    }
    mat <- x$get()
    i <- solve(mat)
    x$setinverse(i)
    i    
}
