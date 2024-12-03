import re

line = input()

products = re.finditer(r"don't\(\)|do\(\)|mul\(([\d]{1,3}),([\d]{1,3})\)", line)
products = [(m.group(), m.start(0), m.groups()) for m in products]

enabled = True
sum = 0

for product in products:
    if product[0].startswith('mul') and enabled:
        sum += int(product[2][0]) * int(product[2][1])
    elif product[0] == "don't()" and enabled:
        enabled = False
    elif product[0] == "do()" and not enabled:
        enabled = True

print(sum)
