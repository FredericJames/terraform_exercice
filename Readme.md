## Infrastructure documentation

The infrastructure is fully based on **GCP**.
Multiple services are leverage:
 - cloud sql (postgres)
 - cloud run (both frontend and api)
 - vertex ai (endpoint + model)
 - IAM serviceaccount

### Limitations taken into account for this exercice:
 - Time and cost
   - time: new to gcp, a lot to learn, so needs to be efficient
   - cost: free trial
 - api open to reach it from the outside, normally only the frontend and a specific role (for dev/test purpose) would have access to it
 - No knowledge on reactjs
 - Found no way to deploy a model on an endpoint through the official google provider


### Security and networking

The fastapi **serviceaccount** is used for the connection between the backend and the database.
Same between the backend and the model.

gcp managed roles are used to give permissions to each resources.

Vertex model use a **private** endpoint.