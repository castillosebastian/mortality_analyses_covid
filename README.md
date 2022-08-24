# DataScience Project Template

ML related tasks:

		- data processing
		- visualization
		- feature engineering
		- training
		- ensembling
		- feature selection
		- hyperparameter optimization
		- experiment tracking
		- submission of prediction to kaggle

## Project Structure
```
- data				
    - features	 	- location for parquet files containing engineered features
    - processed	 	- location for parquet files containing raw data after initial processing
    - raw	 	- location for parquet files containing raw data (train, test, sample submission)
- fi 		 	- location to store feature importances in CSV files
- fi_fig 	 	- location to store plots capturing feature importances
- hpo            	- location to save hyperparameter optimization artifacts
- logs           	- location for logs generated by python modules 
- notebooks	 	- Any Jupyter notebook can be saved here
- oof		 	- Out of fold predictions are saved here
- src			
	- common	- package containing common utility functions
	- config	- package containing configuration related modules
	- cv		- package containing cross validation related functions
	- fe		- package containing feature engineering related functions
	- fs		- package containing feature selection related functions
	- hpo		- package containing hyperparameter optimization related functions
	- modeling	- package containing training/prediction related functions
	- munging	- package containing data processing/exploration related functions
	- pre_process	- package containing data pre-processing related functions
	- scripts	- location for fe, training scripts
	- ts		- package containing time series related functions
	- viz		- package containing data visualization related functions
- submissions           - locations for predictions and submission scripts
- tracking              - CSV file to track experiments
```

## Acknowledgment
- I have borrowed the initial project structure and framework code from [arnabbiswas1's](https://github.com/arnabbiswas1/kaggle_pipeline_tps_aug_22) open sourced code.

## Steps to execute:

1. Clone the source code from github under <PROJECT_HOME> directory.

        > git clone https://github.com/castillosebastian/mortality_analyses_covid.git
    
2. Create r and python (/usr/local/bin/python3) env:
        
        > renv::init()
        > renv::use_python()

3.  Download dataset 

        > 

4. Unzip the data:

        > unzip tabular-playground-series-aug-2022.zip

5. Set the value of variable `HOME_DIR` at `<PROJECT_HOME>/src/config/constants.R` 

6. To process raw data into parquet format, go to `<PROJECT_HOME>/kaggle_pipeline_tps_aug_22`. Execute the following:

        > python -m src.scripts.data_processing.process_raw_data

    This will create 3 parquet files under `<PROJECT_HOME>/kaggle_pipeline_tps_aug_22/data/processed` representing train, test and sample_submission CSVs

7. To trigger feature engineering, go to `<PROJECT_HOME>/kaggle_pipeline_tps_aug_22`. Execute the following:

        > python -m src.scripts.data_processing.create_features

   This will create a parquet file containing all the engineered features under `<PROJECT_HOME>/kaggle_pipeline_tps_aug_22/data/features`

8. To train the baseline model with LGBM, `<PROJECT_HOME>/kaggle_pipeline_tps_aug_22`. Execute the following:

        > python -m src.scripts.training.lgb_baseline

     This will create the submission file under `<PROJECT_HOME>/kaggle_pipeline_tps_aug_22/submissions`. Out of Fold predictions under `<PROJECT_HOME>/kaggle_pipeline_tps_aug_22/oof` and CSVs capturing feature importances under `<PROJECT_HOME>/kaggle_pipeline_tps_aug_22/fi`

Result of the experiment will be tracked at `<PROJECT_HOME>/kaggle_pipeline_tps_aug_22/tracking/tracking.csv`

9. To submit the submission file to kaggle, go to `<PROJECT_HOME>/kaggle_pipeline_tps_aug_22/submissions`:

        > python -m submissions_1.py
