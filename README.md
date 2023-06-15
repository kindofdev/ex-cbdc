# DAML Application example: Central Bank Digital Currency (CBDC)

## Disclaimer
- This is a WIP.
- Not fully tested for production use.

<br>

## Overview

This project has been inspired by Digital Asset "Reference Application: Central Bank Digital Currency (CBDC)" project. The challenge is to develop a similar application using Daml finance library and DAML interfaces.

This project only develops the DAML model and tests for the model. UI has been discarded.

Current DAML SDK version: 2.6.0

https://github.com/digital-asset/ex-cbdc

https://docs.daml.com/daml/reference/interfaces.html

<br>
<br>

## CBDC Diagrams
<br>

### Operator.Role creation + Operator.Role invites Cb (Central Bank)
<br>

![](images/01_operator_role_invite_cb.jpg)

<br>

### Cb.Role invites an user.
<br>

![](images/02_cb_role_invite_user.jpg)

<br>
<br>

### Cb.Role issues regular cbdc.
<br>

![](images/03_cb_role_issue_regular_cbdc.jpg)

<br>
<br>

### Cb.Role issues special cbdc.
<br>

![](images/04_cb_role_issue_special_cbdc.jpg)


### Cb.Role invites a bank.
<br>

![](images/05_cb_role_invite_bank.jpg)

<br>
<br>

### Bank.Role requests cdbc injection from Cb.
<br>

![](images/06_bank_role_request_cbdc_injection.jpg)

<br>
<br>

### Bank.Role requests cdbc extraction from Cb.
<br>

![](images/07_bank_role_request_cbdc_extraction.jpg)

<br>
<br>

### Cb.Role invites a distributor.
<br>

![](images/08_cb_role_invite_distributor.jpg)

<br>
<br>

### Distributor.Role invites a provider.
<br>

![](images/09_distributor_role_invite_provider.jpg)

<br>
<br>

### Provider.Role creates an invoice for a customer.
<br>

![](images/10_provider_role_create_invoice.jpg)

<br>
<br>

## Dependency graph
<br>

![](images/dependency_graph.png)

<br>
<br>

## How to build it
<br>

### Build the fat project.
<br>

```shell
daml build -j
```

<br>

### Build the packages.
<br>

```shell
make
```

<br>

## How to test it.
<br>

```shell
daml test -j
```
