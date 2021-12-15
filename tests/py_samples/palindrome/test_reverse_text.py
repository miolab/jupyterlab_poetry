from src.py_samples import palindrome


def test_入力値を反転させて返す():
    actual = palindrome.reverse_text('あいうえお')
    assert actual == 'おえういあ'
