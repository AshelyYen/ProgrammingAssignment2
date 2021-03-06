## Caching the Inverse of a Matrix  

## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  invsm <- NULL
  set <- function(y){
        x <<- y
        invsm <<- NULL
  }
  get <- function()x
  setinvs <- function(inverse)invsm <<- inverse
  getinvs <- function()invsm
  list(set=set, get=get, setinvs=setinvs, getinvs=getinvs)
}


## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invsm <- x$getinvs()
        if (!is.null(invsm)){
            message("getting cahed data")
            return(invsm)
        }
        data <- x$get()
        invsm <- solve(data, ...)
        x$setinvs(invsm)
        invsm
}
