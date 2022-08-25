
# libraries
pacman::p_load(
  tidyverse, 
  magrittr, 
  tibble, 
  data.table, 
  dtplyr,
  primes,
  log4r, 
  skimr,
  here
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
# x  "get_logger", https://github.com/johnmyleswhite/log4r
#   "update_tracking",
#   "save_file",
#   "save_artifacts",
#   "save_optuna_artifacts",
#   "save_permutation_imp_artifacts",
#   "calculate_final_score",
#   "create_submission_file",
#   "save_artifacts_holdout",
# ]

# log files----
my_logfile = "logfile.txt"
my_console_appender = console_appender(layout = default_log_layout())
my_file_appender = file_appender(my_logfile, append = TRUE, 
                                 layout = default_log_layout())

my_logger <- log4r::logger(threshold = "INFO", 
                           appenders= list(my_console_appender,my_file_appender))

log4r_info <- function(mess) {
  log4r::info(my_logger, paste0("Info_message:", mess))
}

log4r_error <- function(mess) {
  log4r::error(my_logger, paste0("Error_message:", mess))
}

#log4r_info("algo") 
#log4r_error("se rompio todo") 
#readLines(my_logfile)

HOME_DIR = "~/R/mortality_analyses_covid"

RAW_DATA_DIR = paste0(HOME_DIR,  "/data/raw")
PROCESSED_DATA_DIR = paste0(HOME_DIR,  "/data/processed")
FEATURES_DATA_DIR = paste0(HOME_DIR,  "/data/features")
LOG_DIR = paste0(HOME_DIR,  "/logs")
SUBMISSION_DIR = paste0(HOME_DIR,  "/submissions")
OOF_DIR = paste0(HOME_DIR,  "/oof")
FI_DIR = paste0(HOME_DIR,  "/fi")
FI_FIG_DIR = paste0(HOME_DIR,  "/fi_fig")
HPO_DIR = paste0(HOME_DIR,  "/hpo")
LOGS_DIR = paste0(HOME_DIR,  "/logs")
TRACKING_FILE = paste0(HOME_DIR,  "/tracking/tracking.csv")

