# Running Voila apps in ShinyProxy

This repository describes how to add a Voila app inside ShinyProxy.
Voilà turns Jupyter notebooks into standalone web applications. For writing notebooks, checkout the [Jupyter Notebook demo](https://github.com/openanalytics/shinyproxy-jupyter-notebook-demo).


# Build the Docker image

To pull the image made in this repository from Docker Hub, use

```bash
sudo docker pull openanalytics/shinyproxy-voila-demo
```

the relevant Docker Hub repository can be found at https://hub.docker.com/r/openanalytics/shinyproxy-voila-demo

To build the image from the Dockerfile, clone this repository, then navigate to its root directory and run

```bash
sudo docker build -t openanalytics/shinyproxy-voila-demo .
```

# ShinyProxy Configuration

To add the Voila application to ShinyProxy add the following lines to its configuration file (see [application.yml](./application.yml) for a complete file):
```
specs:
  - id: voila-demo
    container-image: openanalytics/shinyproxy-voila-demo
    port: 8080
    container-cmd: ["voila", "basics.ipynb", "--no-browser", "--port=8080", "--base_url=#{proxy.getRuntimeValue('SHINYPROXY_PUBLIC_PATH')}", "--Voila.ip=0.0.0.0"]
    target-path: "#{proxy.getRuntimeValue('SHINYPROXY_PUBLIC_PATH')}"
```

# References

* https://github.com/voila-dashboards/voila/blob/main/notebooks/basics.ipynb


**(c) Copyright Open Analytics NV, 2023.**
