MD := Markdown.pl

CONTENT=$(wildcard *.md)
BUILD=$(patsubst %.md,build/%.md,$(CONTENT))
RENDERED=$(patsubst %.md,rendered/%.html,$(CONTENT))

all: $(RENDERED)

build/%.md: %.md
	cat template/header.md $< template/footer.md > $@

rendered/%.html: build/%.md
	$(MD) $< > $@

clean:
	rm -f $(BUILD)
	rm -f $(RENDERED)
