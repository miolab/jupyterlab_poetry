from src.py_samples import change_calc


def test_メソッドarr_coinが日本円通貨のリストを返すことを保証する():
    # 2021.12月時点の流通通貨単位。2000円札は除外する。
    expected = [
        10000,
        5000,
        1000,
        500,
        100,
        50,
        10,
        5,
        1
    ]
    actual = change_calc.arr_coin()
    assert actual == expected
