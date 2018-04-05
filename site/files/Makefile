MD := Markdown.pl

CONTENT=$(wildcard md/*.md)
BUILD=$(patsubst md/%.md,build/%.md,$(CONTENT))
RENDERED=$(patsubst md/%.md,rendered/%.html,$(CONTENT))

all: $(RENDERED)

build/%.md: md/%.md
	cat template/header.md $< template/footer.md > $@

rendered/%.html: build/%.md
	$(MD) $< > $@

clean:
	rm -f $(BUILD)
	rm -f $(RENDERED)
