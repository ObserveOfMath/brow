# brow -ht be cool B)

import sys
from html.parser import HTMLParser

print("\n", "-"*40)
s = False
a = str()

class Parser(HTMLParser):
    def handle_starttag(self, tag, attr):
        pass
    def handle_endtag(self, tag):
        if tag == "a":
            print("\n")
    def handle_data(self, data):
        global a, s
        a = data
        print(data)

stdin = sys.stdin
file = str()

for line in stdin:
    file += line.strip('\n').strip(' ').replace("<b>", "").replace("</b>", "")

del stdin

Parser().feed(file)

print("\n", "-"*40)
