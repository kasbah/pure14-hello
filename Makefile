PURS = $(call wildc_recursive, bower_components/, *.purs)
HH = $(call wildc_recursive, bower_components/, *.hh)

all: src/Main.purs $(PURS)
	pcc src/Main.purs $(PURS) #--ffi $(HH)

clean:
	rm -rf output/

.PHONY: clean all

wildc_recursive=$(foreach d,$(wildcard $1*),$(call wildc_recursive,$d/,$2)\
			   	$(filter $(subst *,%,$2),$d))

