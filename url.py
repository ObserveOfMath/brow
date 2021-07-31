import sys
for line in sys.stdin:
    print(line.replace(' ', "%20").rstrip('\n'))
    break
