# JupyterLab in Poetry with Docker

[![miolab](https://circleci.com/gh/miolab/jupyterlab_poetry.svg?style=svg)](https://github.com/miolab/jupyterlab_poetry)

**JupyterLab** runtime environment managed by **Poetry** with **Docker**.

<img width="800" alt="jupyterlab_poetry_sample_image" src="img/sample_img_0.png">

<img width="800" alt="jupyterlab_poetry_sample_image" src="img/sample_img_1.png">

---

## :star: Installation

```
$ git clone https://github.com/miolab/jupyterlab_poetry.git
```

```
$ cd jupyterlab_poetry
```

```
$ docker compose build
    .
    .

$ docker compose up
    .
    .
```

After done the above, we can run JupyterLab at http://localhost:8890/lab .

### Information

- Python & Poetry

  ```
  ➜ docker compose exec eda python --version
  Python 3.11.0

  ➜ docker compose exec eda poetry --version
  Poetry (version 1.2.2)
  ```

- Packaging libraries

  See **pyproject.toml** for details.

  - jupyterlab
  - numpy
  - pandas
  - sklearn
  - matplotlib
  - seaborn
  - japanize-matplotlib

  [tool.poetry.dev-dependencies]

  - pytest
  - pytest-watch

## :star: Add more packages

- An example procedure is described here.

  - https://github.com/miolab/jupyterlab_poetry/issues/22

- When running JupyterLab, import the necessary libraries directly on the GUI.

- The basic construction of adding and removing libraries can be configured on `[tool.poetry.dependencies]` in **pyproject.toml** file.

  - Reconstruct and Restart containers

    ```
    $ docker compose build

    $ docker compose up
    ```

## :star: Other information

### Note

- Poetry is used for package management purposes, and the virtual environment `venv` is avoided.

  `poetry config virtualenvs.create false`

### :moon: Uninstallation

To delete environment at once and erase directories, execute the following command.

```
$ docker compose down --rmi all --volumes

$ cd ../

$ rm -rf jupyterlab_poetry
```

---

### :moon: Ref

- Poetry

  - [Official](https://python-poetry.org/)

    - [The pyproject.toml file](https://python-poetry.org/docs/pyproject/)

  - [PyPI](https://pypi.org/project/poetry/)

  - [GitHub](https://github.com/python-poetry/poetry)

- Docker

  [Docker Official Images / Python](https://hub.docker.com/_/python)
