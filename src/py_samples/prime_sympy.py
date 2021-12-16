import sys
import sympy


def main():
    input_num: str = input('任意の自然数を入力してください: ')

    if input_num.isdecimal() is False:
        print('error1')
        sys.exit()

    n = int(input_num)

    if n <= 1 or sympy.isprime(n) == False:
        print('素数ではないです')
        sys.exit()
    else:
        print('素数です')


if __name__ == "__main__":
    main()
