## feature engineering
# El feature engineering es propio de cada dataset
# realiza Feature Engineering sobre el dataset original
# Este script con seguridad va a ser modificado de proyecto en proyecto


#limpio la memoria
rm( list=ls() )  #remove all objects
gc()             #garbage collection


source(paste0(here::here(), "/src/config/constants.R"))
source(paste0(here::here(), "/src/fe/fe_util.R"))


# start activity---

data = readRDS(paste0(RAW_DATA_DIR, "/covid_utn2022.rds"))

data = data %>% ungroup()

log4r_info(paste0("start fe, dim: ",dim(data), rstudioapi::getActiveDocumentContext()$path))










log4r_info(paste0("end fe, dim: ",dim(data), rstudioapi::getActiveDocumentContext()$path))


# save log----
my_logfile <- as_tibble(readLines(my_logfile))
fwrite(my_logfile, paste0(LOGS_DIR, "/logs.txt"), append = T, sep= "\t")
