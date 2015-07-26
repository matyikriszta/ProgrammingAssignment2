## the first function, makeCacheMatrix creates a special matrix which is a list containing a function to set he value of the matrix, to ge the value of the matrix, to set the inverse value of the matrix and to ge the inverse value of the matrix
## the second function, cacheSolve, uses the functions from the first function to calculate the inverse of the matrix, but first the function check if the inverse of the matrix has been set and only calculates the inverse if it hasn't

## makeCacheMatrix function sets up 4 functions: one that sets the value of the matrix (set), one that gets the value of the matrix (get), one that sets the inverse value of the matrix (setinverse) and one that gets the inverse value of the matrix (getinverse)

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y) {
		x <<- y
		i <<- NULL
	}
	get <- function() x
	setinverse <- function(solve) i <<- solve
	getinverse <- function() i
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## function looks up the value of getinverse function from makeCacheMatrix and assign it to the variable i. If i is NOT null, function returns i, otherwise it gets the matrix passed into makeCacheMatrix, inverses it using solve() function, and sets the value of i to the inversed version of data

cacheSolve <- function(x, ...) {
	i <- x$getinverse()
	if(!is.null(i)) {
		message("getting cached data")
		return(i)
	}
	data <- x$get()
	i <- solve(data)
	x$setinverse(i)
	i
}



