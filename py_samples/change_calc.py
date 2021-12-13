import sys


def main():
    price = input('商品価格(円): ')
    print_amount(price)

    input_amount = input('投入する金額(円): ')
    print_amount(input_amount)


def print_amount(yen):
    if not yen.isdecimal():
        print(yen + ' は金額として無効です。整数を入力してください。')
        sys.exit()
    else:
        print(yen + '円')


if __name__ == "__main__":
    main()
