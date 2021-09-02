# App Operators and Tanzu Application Platform

* **workloads**: the proudction definition of each individual component (e.g. a microservice) construcing this business application 

* **supply chain**: the definition of the software supply chain, i.e., the definition of the steps that source code will flow through to get to a deployment

* **supply chain templates**: the definition of how resources should be stamped out to carry work (e.g., the templates for kpack/Image, carto.run/Pipeline, etc)

* **pipeline service run template**: configuration supplied by the app operator to describe how the pipeline service controller should deal with instantiating runs for pipeline executions.
