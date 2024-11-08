SIZE = 10000

def find_sum_for_number(n):
    res_sum = 0
    for div in range(1, n):
        if n % div == 0:
            res_sum += div
    return res_sum

def solve(n):
    my_map = {key: find_sum_for_number(key) for key in list(range(2, n))}
    ret_sum = 0
    for key in my_map:
        if my_map[key] in my_map and key == my_map[my_map[key]] and key != my_map[key]:
            ret_sum += key
    return ret_sum

print(solve(SIZE))