import sys


def main():
    price: str = input('商品価格(円): ')
    display_input_amount(price)

    input_amount: str = input('投入する金額(円): ')
    display_input_amount(input_amount)

    change: int = calc_diff(input_amount, price)

    for i in arr_coin():
        num = change // i
        change %= i
        print(
            str(i) + '円: ' + str(num) + ' 枚'
        )


def display_input_amount(yen: str) -> str:
    if not yen.isdecimal():
        print(yen + ' は金額として無効です。整数を入力してください。')
        sys.exit()
    print(yen + '円')


def calc_diff(input_amount: str, price: str) -> int:
    change: int = int(input_amount) - int(price)

    if change < 0:
        print(
            str(abs(change)) + ' 円不足しています。'
        )
        sys.exit()
    else:
        print(
            'お釣り: ' + str(change) + '円'
        )
        return change


def arr_coin() -> list:
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
