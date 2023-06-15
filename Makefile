BUILD_CMD=daml build --incremental yes -j
DAR_VERSION := $(shell grep ^version daml.yaml | sed 's/\(version:\) //g')
DAR_NAME := $(shell grep ^name daml.yaml | sed 's/\(name:\) //g')

.PHONY: all
all: fat billing cbdc certificate finance interface-billing interface-certificate interface-finance

.PHONY: fat billing cbdc certificate finance interface-billing interface-certificate interface-finance
fat: deps
	${BUILD_CMD}
billing: deps interface-billing interface-certificate interface-finance
	DAML_PROJECT="package/main/daml/Billing" ${BUILD_CMD}
cbdc: deps interface-billing interface-certificate interface-finance
	DAML_PROJECT="package/main/daml/Cbdc" ${BUILD_CMD}
certificate: deps interface-certificate
	DAML_PROJECT="package/main/daml/Certificate" ${BUILD_CMD}
finance: deps interface-certificate interface-finance
	DAML_PROJECT="package/main/daml/Finance" ${BUILD_CMD}
interface-billing: deps interface-certificate
	DAML_PROJECT="package/main/daml/Interface.Billing" ${BUILD_CMD}
interface-certificate: deps
	DAML_PROJECT="package/main/daml/Interface.Certificate" ${BUILD_CMD}
interface-finance: deps interface-certificate
	DAML_PROJECT="package/main/daml/Interface.Finance" ${BUILD_CMD}

.PHONY: deps
deps:
	scripts/deps.py $(shell pwd)

.PHONY: clean
clean:
	scripts/clean.sh $(shell pwd)
