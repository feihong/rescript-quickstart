import itertools

def get_chars():
  with open('SUBTLEX-CH-CHR.csv') as fp:
    for line in fp:
      c, _ = line.split(',', 1)
      yield c

for i, c in enumerate(itertools.islice(get_chars(), 4000), 1):
  print(i, c)
