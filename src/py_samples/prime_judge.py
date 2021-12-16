import sys
import math


def main():
    input_num: str = input('任意の自然数を入力してください: ')

    if input_num.isdecimal() is False:
        exit_with_msg('数値を入力してください')

    n = int(input_num)

    if n <= 1:
        exit_with_msg('素数ではないです')

    limit = math.ceil(
        math.sqrt(n)
    )

    for i in range(2, limit):
        if n % i == 0:
            exit_with_msg('素数ではないです')

    print('素数です')


def exit_with_msg(msg: str):
    print(msg)
    sys.exit()


if __name__ == "__main__":
    main()
