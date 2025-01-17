variable "credentials" {
  description = "My Credentials"
  default     = "../../keys/my-creds.json"
}

variable "project" {
  description = "Project"
  default     = "terraform-demo-448014"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "gcs_bucket_name" {
  description = "Google Cloud Storage bucket"
  default     = "terraform_demo_obairka_bucket"
}

variable "bq_dataset_name" {
  description = "BigQuery Dataset Name"
  default     = "terraform_demo_obairka_dataset"
}
