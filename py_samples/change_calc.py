import sys


def main():
    price = input('商品価格(円): ')
    print_amount(price)

    input_amount = input('投入する金額(円): ')
    print_amount(input_amount)

    change = calc_diff(input_amount, price)

    for i in arr_coin():
        num = change // i
        change %= i
        print(str(i) + '円: ' + str(num) + ' 枚')


def print_amount(yen):
    if not yen.isdecimal():
        print(str(yen) + ' は金額として無効です。整数を入力してください。')
        sys.exit()
    else:
        print(str(yen) + '円')


def calc_diff(input_amount, price):
    change = int(input_amount) - int(price)

    if change < 0:
        print(str(abs(change)) + ' 円不足しています。')
        sys.exit()
    else:
        print('お釣り: ' + str(change) + '円')
        return change


def arr_coin():
    return [
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


if __name__ == "__main__":
    main()
