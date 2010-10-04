### Makefile.tpl --- (>>>POINT<<<)

## Author: (>>>AUTHOR<<<)
## Version: $Id: (>>>FILE<<<),v 0.0 (>>>VC_DATE<<<) (>>>LOGIN_NAME<<<) Exp $
## Keywords: (>>>1<<<)
## X-URL: (>>>2<<<)

ifeq ($(VERBOSE),1)
	Q =
else
	Q = @
endif

.PHONY: default
default:
	$(Q)echo "Building default..."

.PHONY: all
all:
	$(Q)echo "Building all..."

.PHONY: clean
clean:
	$(Q)echo "Cleaning up..."

### (>>>FILE<<<) ends here
