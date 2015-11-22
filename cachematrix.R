## Cache the inverse of a matrix

## Function to create matrix, returns a list containing functions to
## 1. set value of matrix
## 2. get value of matrix
## 3. set value of inverse of matrix
## 4. get value of inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function (y) {
        x <<- y
        i <<- NULL
    }
    get    <- function() x
    setInv <- function(inv) i <<-inv
    getInv <- function() i
    list(set=set, get=get, 
         setInv=setInv, getInv=getInv)
}


## Gets cached inverse of matrix, if cache not available, calculates the inverse of matrix 

cacheSolve <- function(x, ...) {
    i <- x$getInv()
    if(!is.null(i)){
        message("Getting cached data")
        return (i)
    }
    data <- x$get()
    i    <- solve(data)
    x$setInv(i)
    i
}
