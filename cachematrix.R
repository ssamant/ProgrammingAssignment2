##This pair of functions, makeCacheMatrix and cacheSolve, can be used to create 
##and store a matrix and cache its inverse. 


##makeCacheMatrix creates and stores a matrix. Use the subfunctions to retrieve the matrix, 
##re-assign the matrix, and retrieve and set the inverse of the matrix. 
##Use with the function cacheSolve to calculate and cache the inverse for retrieval.  

makeCacheMatrix <- function(x=matrix()) {      
	inv <- NULL
	set <- function(y){								
		x <<- y
		inv <<- NULL  
		}
	get <- function() {x
		}
	setinv <- function(solve_inv) {inv <<- solve_inv
		}
	getinv <- function() {inv 	
		}
	list(set = set, get = get, 
		setinv = setinv,
		getinv = getinv)
	}
	
	
##cacheSolve computes and caches the inverse of the matrix stored by makeCacheMatrix. 
##If the inverse has already been solved and the matrix has not been changed, 
##cacheSolve will return the cached inverse matrix. 

cacheSolve  <- function(x, ...){
	inv <- x$getinv()
	if(!is.null(inv)){
		message("getting cached data")
		return(inv)
	}
	data <- x$get()
	inv <-solve(data, ...)
	x$setinv(inv)
	inv
}
