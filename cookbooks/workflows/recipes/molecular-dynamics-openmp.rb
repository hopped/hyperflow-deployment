package 'gcc'
package 'git'
package 'build-essential'



# Install Molecular Dynamics OpenMP version from source

md_tarball = "MD_v4_OMP.tar.gz"
md_dir="/MD_v4_OMP"
scripts_dir="/MolecularDynamicsParameterStudy"

git "/#{md_dir}" do
  repository "https://github.com/hopped/molecular-dynamics-simulation"
  reference "master"
  action :sync
end

#remote_file "/#{md_tarball}" do
# source "https://dl.dropboxusercontent.com/s/alho0mwrg4dg45b/#{md_tarball}"
# action :create_if_missing
#end

#execute "tar" do
# cwd "/"
# command "tar zxv --no-same-owner --no-same-permissions -f /#{md_tarball}"
# creates md_dir
# action :run
#end

execute "compile" do
  not_if "test -f #{md_dir}/src/main"
  cwd md_dir
  command "cd src && make TARGET=RELEASE OMP=1 ARCH=CPU COMPILER=gcc && cp CMD_CPU main"
  action :run
end

bash "copy" do
  not_if "test -f #{scripts_dir}/src/main"
  cwd "/"
  code <<-EOH
  cp -r /node_modules/hyperflow/examples/MolecularDynamicsParameterStudy/ .
  mkdir #{scripts_dir}/src
  cp #{md_dir}/src/main #{scripts_dir}/src
  cp #{md_dir}/pov-template.inc #{scripts_dir}
  EOH
end
