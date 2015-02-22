
##This pair of functions, makeCacheMatrix and cacheSolve, can be used to create 
##and store a matrix and cache its inverse. 


##makeCacheMatrix creates and stores a matrix. Use the subfunctions to retrieve the matrix, 
##re-assign the matrix, and retrieve and set the inverse of the matrix. 
##Use with the function cacheSolve to calculate and cache the inverse for retrieval.  

makeCacheMatrix <- function(x=matrix()) {      				
    inv <- NULL                                         ##sets inverse to NULL
    set <- function(y){                                 ##subfunction allows matrix to be re-set
        x <<- y	                                        ##matrix is re-set in enclosing environment
        inv <<- NULL  									##inverse is re-set in enclosing enviro. no more cached inverse
        }
    get <- function() {x                                ##subfunction retrieves matrix
        }
    setinv <- function(solve_inv) {inv <<- solve_inv    ##subfunction sets inverse in enclosing enviro  
        }														
    getinv <- function() {inv                           ##subfunction retrieves inverse
		}													
    list(set = set, get = get, 								
        setinv = setinv,
        getinv = getinv)
    }
	
	
##cacheSolve computes and caches the inverse of the matrix stored by makeCacheMatrix. 
##If the inverse has already been solved and the matrix has not been changed, 
##cacheSolve will return the cached inverse matrix. 

cacheSolve  <- function(x, ...){
    inv <- x$getinv()                                   ##assigns subfunction $getinv to inv 
    if(!is.null(inv)){                                  ##if inverse is already assigned, returns it
        message("getting cached data")
        return(inv)
    }
    data <- x$get()                                     ##assigns matrix to 'data' and calculates inverse
    inv <-solve(data, ...)									
    x$setinv(inv)                                       ##assigns inverse to subfunction $setinv
    inv													
}
