# JupyterLab in Poetry (in Docker)

[![miolab](https://circleci.com/gh/miolab/jupyterlab_poetry.svg?style=svg)](https://github.com/miolab/jupyterlab_poetry)

- **`JupyterLab`** の実行環境を、**`Poetry`** を使って `Docker` コンテナで構築しています  
  （CircleCI による CIパイプライン構築済み）

  <img width="800" alt="jupyterlab_poetry" src="https://user-images.githubusercontent.com/33124627/78244333-55f8e680-7520-11ea-924a-5195a74fc7ed.png">

---

## 使い方

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

上記まで実行したら、[http://localhost:8888/lab](http://localhost:8888/lab)で確認・JupyterLab 実行可能です

---

## tree

```
.
├── Dockerfile
├── README.md
├── docker-compose.yml
├── pyproject.toml
└── sample_jupyter.ipynb
```

## Environment

|                | バージョン |
| :------------- | :--------- |
| Mac            |            |
| Docker         | 19.03.12    |
| Docker-compose | 1.26.2     |

```
$ docker-compose exec eda python --version
Python 3.8.5

$ docker-compose exec eda poetry --version
Poetry version 1.0.10
```

## Packaging Libraries

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

## Note

- Poetry はパッケージ管理用途としており、仮想環境 venv は作成回避しています。

  （`poetry config virtualenvs.create false`）

- ライブラリの追加・削除は **`pyproject.toml`** ファイル内 `[tool.poetry.dependencies]` の記述で設定。

  - 再構築＆コンテナ再起動

    ```
    $ docker-compose build

    $ docker-compose up
    ```

---

### 環境削除

コンテナやイメージをまとめて全削除しディレクトリ消去するには、以下コマンドを実行してください

```
$ docker-compose down --rmi all --volumes

$ cd ../

$ rm -rf jupyterlab_poetry
```

---

### 参考

- [Poetry](https://python-poetry.org/)

- [PyPI](https://pypi.org/project/poetry/)

- [Docker Official Images / Python](https://hub.docker.com/_/python)
