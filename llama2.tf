resource "google_vertex_ai_endpoint" "endpoint" {
  name         = "cng-llama2"
  display_name = "cng"
  description  = "A sample vertex endpoint"
  location     = "us-east1"
  region       = "us-east1"


}