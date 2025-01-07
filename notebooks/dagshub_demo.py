
#import certifi
import os

# Set SSL certificate file
#os.environ['SSL_CERT_FILE'] = certifi.where()
#os.environ['REQUESTS_CA_BUNDLE'] = certifi.where()


import mlflow
import dagshub

mlflow.set_tracking_uri('https://dagshub.com/Abhimanyu9539/mlops-mini-project.mlflow/')
dagshub.init(repo_owner='Abhimanyu9539', repo_name='mlops-mini-project', mlflow=True)

import mlflow
with mlflow.start_run():
  # Your training code here...
  mlflow.log_metric('accuracy', 42)
  mlflow.log_param('Param name', 'Value')