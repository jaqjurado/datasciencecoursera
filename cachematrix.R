## Checks valid input and compute the inverse of a square matrix

## checkIfMatrix - check if input is a valid matrix
## checkIfSquare - check if input is a valid square matrix
## getInverseMatrix - computes the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  checkIfMatrix <- function ()  m  <<- is.matrix(x)
  checkIfSquare <- function ()  m  <<- nrow(x)==ncol(x)
  getInverseMatrix <- function() inverse <<- solve(x) 
  list(checkIfMatrix = checkIfMatrix, checkIfSquare=checkIfSquare, getInverseMatrix=getInverseMatrix)
}


## uses the checkIfMatrix function on makeCacheMatrix to check if input is a valid matrix
## if not a valid matrix stop and return an error message
## if not a valid square matrix stop and return an error message
## if valid square matrix, compute and return the inverse

cacheSolve <- function(x, ...) {

  m <- x$checkIfMatrix()

  if (m == FALSE) stop ("Input is not a matrix")
  
  else {
   s <- x$checkIfSquare()
   if (s == FALSE) stop ("Input is not a square matrix")
   
   else {
     inverse <- x$getInverseMatrix()
     return(inverse)
   }
   
 }

}
