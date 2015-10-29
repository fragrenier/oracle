#
# Cookbook Name:: oracle
# Recipe:: tnsnames_cli
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
## Create tnsnames.ora and add entries (Oracle client installation).
#

# Create and populate tnsnames.ora file.
template "#{node[:oracle][:client][:ora_home]}/network/admin/tnsnames.ora" do
  source 'tnsnames.ora.erb'
  owner node[:oracle][:cliuser][:edb]
  group node[:oracle][:cliuser][:ora_cli_grp]
  mode '0644'
  variables(
    filename: path,
    tnsnames_entry: node[:oracle][:tnsnames]
  )
end
