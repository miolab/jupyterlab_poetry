import sys


def main():
    input_str = input('回文判定したい文字列を入力: ')

    print(
        display_palindrome_or_not(input_str)
    )


def reverse_text(text):
    if len(text) < 2:
        print('無効な値です。2文字以上で入力してください。')
        sys.exit()
    return ''.join(reversed(text))


def display_palindrome_or_not(text):
    reversed_text = reverse_text(text)

    if text == reversed_text:
        return '回文です'
    else:
        return '回文ではないです。結果: ' + reversed_text


if __name__ == "__main__":
    main()
