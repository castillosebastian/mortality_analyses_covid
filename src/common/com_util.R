# libraries
pacman::p_load(
  tidyverse, 
  magrittr, 
  tibble, 
  data.table, 
  dtplyr,
  primes,
  log4r
) # data wrangling packages
# pacman::p_load(tidyverse, magrittr, tibble, ggfortify, forecast, data.table, dtplyr) # data wrangling packages
# pacman::p_load(timetk, modeltime, fpp3, tsibble, tidymodels, modeltime.gluonts, modeltime.ensemble, modeltime.resample) # time series model packages
# pacman::p_load(lightgbm, xgboost)
# pacman::p_load(foreach, future) # parallel functions
# pacman::p_load(viridis, plotly) # visualizations packages
# theme_set(hrbrthemes::theme_ipsum()) # set default themes

# util function
# __all__ = [
#   "set_seed",
#   "trigger_gc",
#   "set_timezone",
#   "get_logger",
#   "update_tracking",
#   "save_file",
#   "save_artifacts",
#   "save_optuna_artifacts",
#   "save_permutation_imp_artifacts",
#   "calculate_final_score",
#   "create_submission_file",
#   "save_artifacts_holdout",
# ]

my_logfile = "my_logfile.txt"

my_console_appender = console_appender(layout = default_log_layout())
my_file_appender = file_appender(my_logfile, append = TRUE, 
                                 layout = default_log_layout())

my_logger <- log4r::logger(threshold = "INFO", 
                           appenders= list(my_console_appender,my_file_appender))

log4r_info <- function() {
  log4r::info(my_logger, "Info_message.")
}

log4r_error <- function() {
  log4r::error(my_logger, "Error_message")
}

log4r_debug <- function() {
  log4r::debug(my_logger, "Debug_message")
}

log4r_debug() # will not trigger log entry because threshold was set to INFO

log4r_info() 
#> INFO  [2020-07-01 12:48:02] Info_message.

log4r_error() 
#> ERROR [2020-07-01 12:48:02] Error_message

readLines(my_logfile)

