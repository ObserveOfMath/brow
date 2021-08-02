import sys
from html.parser import HTMLParser

class Parser(HTMLParser):
    def handle_starttag(self, tag, attr):
        pass
    def handle_endtag(self, tag):
        self.r += 1
    def handle_data(self, data):
        if self.r == 0:
            self.hasWiki = not self.hasWiki
        if self.hasWiki:
            if (self.r % 12 == 7) or (self.r == 0):
                print("-"*60)
            else:
                print()
            if data != "Feedback":
                print(data)
        else:
            if not (self.r % 12):
                print("-"*60)
            else:
                print()
            if data != "Feedback":
                print(data)

stdin = sys.stdin
file = str()

for line in stdin:
    file += line.strip('\n').strip(' ').replace("<b>", "").replace("</b>", "")

del stdin

parse = Parser()
parse.r = 0
parse.hasWiki = False
parse.feed(file)
