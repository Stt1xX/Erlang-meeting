FILE_NAME = "task8"
SIZE_OF_ADJACENT_DIGITS = 13

def read_file():
    with open(FILE_NAME, 'r') as file:
        str = file.read().replace('\n', '')
        res_list = []
        for char in str:
            res_list.append(int(char))
        return res_list

def find_numbers(number_list, n):
    curr_list, curr_val = read_n_chars_from_index(0, n, number_list)
    max_list, max_val = curr_list, curr_val
    for i in range(n, len(number_list) - n):
        if number_list[i - n] != 0:
            curr_val = curr_val * number_list[i] / number_list[i - n]
            curr_list = curr_list[1:] + [number_list[i]]
        else:
            curr_list, curr_val = read_n_chars_from_index(i - n + 1, n, number_list)
        if curr_val > max_val:
            max_val = curr_val
            max_list = curr_list
    return max_list, max_val

def read_n_chars_from_index(index, n, number_list):
    res_list = []
    mult = 1
    for c in range(index, index + n):
        mult *= number_list[c]
        res_list.append(c)
    return res_list, mult

def solve(n):
    max_list, max_val = find_numbers(number_list=read_file(), n=n)
    print(max_val)


solve(SIZE_OF_ADJACENT_DIGITS)