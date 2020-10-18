# JupyterLab in Poetry (in Docker)

[![miolab](https://circleci.com/gh/miolab/jupyterlab_poetry.svg?style=svg)](https://github.com/miolab/jupyterlab_poetry)

- **`JupyterLab`** の実行環境を、**`Poetry`** を使って `Docker` コンテナで構築しています  
  （CircleCI による CI パイプライン構築済み）

  <img width="800" alt="jupyterlab_poetry" src="https://user-images.githubusercontent.com/33124627/78244333-55f8e680-7520-11ea-924a-5195a74fc7ed.png">

---

## :star: 使い方

```
$ git clone https://github.com/miolab/jupyterlab_poetry.git
```

```
$ cd jupyterlab_poetry
```

```
$ docker-compose build
    .
    .

$ docker-compose up
    .
    .
```

上記まで実行したら、**[http://localhost:8888/lab](http://localhost:8888/lab)** で JupyterLab 実行可能です

---

## :star: tree

```
.
├── Dockerfile
├── README.md
├── docker-compose.yml
├── pyproject.toml
└── sample_jupyter.ipynb
```

## :star: Environment

- 検証環境

  |                | バージョン |
  | :------------- | :--------- |
  | Mac            |            |
  | Docker         | 19.03.13   |
  | Docker-compose | 1.27.4     |

- Python & Poetry バージョン

  ```
  $ docker-compose exec eda python --version
  Python 3.8.6

  $ docker-compose exec eda poetry --version
  Poetry version 1.1.3
  ```

- ライブラリ

  - 基本的には最新版を fetch してきます

  - 詳細は `pyproject.toml` 参照

## :star: Packaging Libraries

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

## :star: Note

- **JupyterLab 実行の際に、必要となるライブラリは 直接 `import` してください**

- ライブラリの追加・削除は **`pyproject.toml`** ファイル内 `[tool.poetry.dependencies]` の記述で設定可能です

  - 再構築＆コンテナ再起動

    ```
    $ docker-compose build

    $ docker-compose up
    ```

- Poetry はパッケージ管理用途としており、仮想環境 venv は作成回避しています

  （`poetry config virtualenvs.create false`）

---

### :moon: 環境削除

コンテナやイメージをまとめて全削除しディレクトリ消去するには、以下コマンドを実行してください

```
$ docker-compose down --rmi all --volumes

$ cd ../

$ rm -rf jupyterlab_poetry
```

---

### :moon: 参考

- Poetry

  - [公式](https://python-poetry.org/)

    - [The pyproject.toml file](https://python-poetry.org/docs/pyproject/)

  - [PyPI](https://pypi.org/project/poetry/)

  - [GitHub](https://github.com/python-poetry/poetry)

- Docker

  [Docker Official Images / Python](https://hub.docker.com/_/python)
