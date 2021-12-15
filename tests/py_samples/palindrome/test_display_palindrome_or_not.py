from src.py_samples import palindrome


def test_回文テキストが入力されたら_回文です_テキストを返す():
    actual = palindrome.display_palindrome_or_not('とまと')
    assert actual == '回文です'


def test_回文ではないテキストが入力されたら_回文ではないです_テキストを返す():
    actual = palindrome.display_palindrome_or_not('サラダ')
    assert actual == '回文ではないです。結果: ダラサ'
