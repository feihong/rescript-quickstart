import re
from collections import Counter

def get_lines():
  with open('cedict.txt') as fp:
    for line in fp:
      if not line.startswith('#'):
        yield line.strip()

def get_entries():
  pattern = re.compile(r"^(?P<trad>[^ ]+) (?P<simp>[^ ]+) \[(?P<pinyin>.*)\] \/(?P<gloss>.*)\/$")
  for line in get_lines():
    yield pattern.match(line).groupdict()

usage_counter = Counter()

for entry in get_entries():
  simp = entry['simp']
  if len(simp) > 1:
    for c in simp:
      if ord(c) >= 0x4e00:
        usage_counter[c] += 1

for (i, (c, n)) in enumerate(usage_counter.most_common(4000), 1):
  print(i, c, n)

print(len(usage_counter))
