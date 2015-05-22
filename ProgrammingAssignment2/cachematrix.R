## Checks valid input and compute the inverse of a square matrix and return inverse from cache if solving the same matrix

## checkIfMatrix - check if input is a valid matrix
## checkIfSquare - check if input is a valid square matrix ; check if it can be inversible
## getInverseMatrix - computes the inverse matrix
## getMatrix <- get the matrix values

makeCacheMatrix <- function(x = matrix()) {
  checkIfMatrix <- function ()  m  <<- is.matrix(x)
  checkIfSquare <- function ()  m <<- try(solve(x),silent=T)
  getInverseMatrix <- function() inverse <<- solve(x) 
  getMatrix <- function() x
  list(checkIfMatrix = checkIfMatrix, checkIfSquare=checkIfSquare, getInverseMatrix=getInverseMatrix, getMatrix=getMatrix)
}


## uses the checkIfMatrix function on makeCacheMatrix to check if input is a valid matrix
## if not a valid matrix stop and return an error message
## if input is a matrix check it is a valid square matrix if not a valid square matrix stop and return an error message
## if valid square matrix, compute and return the inverse

cacheSolve <- function(x, ...) {

  m <- x$checkIfMatrix()
  
  if (m == FALSE) stop ("Input is not a matrix")  #prints error if input is not a matrix and stop the function
  
  else {
    s <- x$checkIfSquare()
 
    if (is(s,"try-error")) stop ("Input is not a square matrix") #prints error if input is not a square matrix and stop the function
    
    else {
     y <- x$getMatrix()
      c <- (identical(y, matrix)) # check is input matrix is the same as the last calculated matrix

       if (c == TRUE){
         print("getting inverse matrix from cache")
         return(inverse)
       }
     
      else{    
      inverse <- x$getInverseMatrix()  # calculate inverse and save inverse 
      matrix <<- x$getMatrix()         # save original matrix for comparison in the next run (e.g. to determine if inverse is already available)
      return(inverse)
      }
    }
    
  }
  
}
