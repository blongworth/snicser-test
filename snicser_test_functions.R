# Functions for testing SNICSer

deleteWheel <- function(wheel) {
  con <- amstools::conNOSAMS()
  raw <- dbSendQuery(con, "DELETE FROM snics_raw_test WHERE wheel = ?")
  dbBind(raw, list(wheel))
  dbClearResult(raw)
  results <- dbSendQuery(con, "DELETE FROM snics_results_test WHERE wheel = ?")
  dbBind(results, list(wheel))
  dbClearResult(results)
}

setAnalyst <- function(wheel) {
  con <- amstools::conNOSAMS()
  raw <- dbSendQuery(con, "UPDATE snics_raw_test 
                             SET analyst = 'test'
                             WHERE wheel = ?")
  dbBind(raw, list(wheel))
  dbClearResult(raw)
  
  results <- dbSendQuery(con, "UPDATE snics_results_test 
                             SET analyst1 = 'test' 
                             WHERE wheel = ?")
  dbBind(results, list(wheel))
  dbClearResult(results)
}