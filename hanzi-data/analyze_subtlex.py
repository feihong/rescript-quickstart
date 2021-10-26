import itertools

def get_chars():
  with open('SUBTLEX-CH-CHR.csv') as fp:
    for line in fp:
      c, _ = line.split(',', 1)
      yield c

top_chars = itertools.islice(get_chars(), 4000)

# for i, c in enumerate(top_chars, 1):
#   print(i, c)

# top_ords = [ord(c) for c in top_chars]
# top_ords.sort()

# ranges = [(top_ords[0], top_ords[0])]

# for o in top_ords[1:]:
#   last_range = ranges[-1]
#   if o == last_range[1] + 1:
#     ranges[-1] = (last_range[0], o)
#   else:
#     ranges.append((o, o))

# for (i, (s, e)) in enumerate(ranges, 1):
#   print(i, end='. ')
#   if s == e:
#     print(s)
#   else:
#     print(s, e, f'{e - s + 1}')

print(''.join(top_chars))
