## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# Input:  x - a matrix
# Output: a list that contains methods for accessing internal states of the cached matrix
makeCacheMatrix <- function(x = matrix()) {
  # Variable that stores the inverse
  inv <- NULL
  
  # Function that sets the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  # Function that gets the matrix
  get <- function() {
    x
  }
  
  # Function that sets the inverse
  setInv <- function(inverse) {
    inv <<- inverse
  }
  
  # Function that gets the inverse
  getInv <- function() {
    inv
  }
  
  # Return list of functions
  list(set = set, get = get, setInv = setInv, getInv = getInv)
}


## Write a short comment describing this function
# Input:  x - a matrix created with 'makeCacheMatrix'
# Output: the cached inverse of the matrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat)
  x$setInv(inv)
  inv
}
