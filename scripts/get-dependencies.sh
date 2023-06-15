#!/usr/bin/env bash

set -eu

# Create .lib directory if it doesn't exist
if [[ ! -d .lib ]]; then
  mkdir .lib
fi

get_dependency () {
  local package_name=$1
  local module_name=$2
  local version=$3
  local url="https://github.com/digital-asset/daml-finance/releases/download/${module_name}/${version}/${package_name}-${version}.dar"
  echo "Getting dependency ${package_name} v${version}"
  if [[ ! -a ".lib/${package_name}-${version}.dar" ]]; then curl -Lf# $url -o .lib/$package_name-$version.dar; fi
}

get_dependency contingent-claims-core                     ContingentClaims.Core                     1.0.0
get_dependency contingent-claims-lifecycle                ContingentClaims.Lifecycle                1.0.0
get_dependency daml-finance-account                       Daml.Finance.Account                      1.0.1
get_dependency daml-finance-claims                        Daml.Finance.Claims                       1.0.1
get_dependency daml-finance-data                          Daml.Finance.Data                         1.0.1
get_dependency daml-finance-holding                       Daml.Finance.Holding                      1.0.2
get_dependency daml-finance-instrument-generic            Daml.Finance.Instrument.Generic           1.0.1
get_dependency daml-finance-instrument-token              Daml.Finance.Instrument.Token             1.0.1
get_dependency daml-finance-interface-account             Daml.Finance.Interface.Account            1.0.0
get_dependency daml-finance-interface-claims              Daml.Finance.Interface.Claims             1.0.0
get_dependency daml-finance-interface-data                Daml.Finance.Interface.Data               2.0.0
get_dependency daml-finance-interface-holding             Daml.Finance.Interface.Holding            1.0.0
get_dependency daml-finance-interface-instrument-base     Daml.Finance.Interface.Instrument.Base    1.0.0
get_dependency daml-finance-interface-instrument-generic  Daml.Finance.Interface.Instrument.Generic 1.0.0
get_dependency daml-finance-interface-instrument-token    Daml.Finance.Interface.Instrument.Token   1.0.0
get_dependency daml-finance-interface-lifecycle           Daml.Finance.Interface.Lifecycle          1.0.0
get_dependency daml-finance-interface-settlement          Daml.Finance.Interface.Settlement         1.0.0
get_dependency daml-finance-interface-types-common        Daml.Finance.Interface.Types.Common       1.0.0
get_dependency daml-finance-interface-types-date          Daml.Finance.Interface.Types.Date         2.0.0
get_dependency daml-finance-interface-util                Daml.Finance.Interface.Util               1.0.0
get_dependency daml-finance-lifecycle                     Daml.Finance.Lifecycle                    1.0.1
get_dependency daml-finance-settlement                    Daml.Finance.Settlement                   1.0.2
get_dependency daml-finance-util                          Daml.Finance.Util                         2.0.0
