/*
    This file is part of Terranetes (https://github.com/f0o/terranetes)
    Copyright (C) 2019  Daniel 'f0o' Preussker <f0o@devilcode.org>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

output "ignition" {
  value = "${data.ignition_config.ignition.*}"
}

output "pki" {
  value = "${local.pki}"
}

output "k8s" {
  value = "${local.k8s}"
}

output "admin" {
  value = {
    kubeconfig = "${templatefile("${path.module}/kubeconfig.tmpl", map("api", "%API", "user", "admin", "crt", "admin.crt", "key", "admin.key", "ca", "ca.crt"))}"
    cert       = "${local.pki.users.admin[0]}"
    key        = "${local.pki.users.admin[1]}"
    ca         = "${local.pki.ca.cert}"
  }
}