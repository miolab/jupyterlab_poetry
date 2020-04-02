# JupyterLab in Poetry (in docker-compose)

- **`JupyterLab`** の実行環境を、**`Poetry`** を使って`docker-compose`で Docker コンテナに構築

  <img width="800" alt="jupyterlab_poetry" src="https://user-images.githubusercontent.com/33124627/78244333-55f8e680-7520-11ea-924a-5195a74fc7ed.png">

---

## Usage

```
$ git clone https://github.com/miolab/jupyterlab_poetry.git
```

```
$ cd jupyterlab_poetry/
```

```
$ docker-compose up -d
```

上記まで実行したら、[http://localhost:8888/lab](http://localhost:8888/lab)で確認・JupyterLab 実行。

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
| Docker         | 19.03.8    |
| Docker-compose | 1.25.4     |
| Python         | 3.8        |

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

- Poetry はパッケージ管理用途としており、仮想環境 venv 作成は回避しています。

  （`poetry config virtualenvs.create false`）

- ライブラリの追加・削除は **`pyproject.toml`** ファイル内 `[tool.poetry.dependencies]` の記述で設定。

  - `docker-compose up -d --build` で再構築＆コンテナ再起動
