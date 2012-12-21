# Author:: Couchbase <info@couchbase.com>
# Copyright:: 2012 Couchbase, Inc.
# License:: Apache License, Version 2.0
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

gem 'rake-compiler', '>= 0.7.5'
require "rake/javaextensiontask"

def gemspec
  @clean_gemspec ||= eval(File.read(File.expand_path('../../gson.gemspec', __FILE__)))
end

Rake::JavaExtensionTask.new('gson_ext', gemspec) do |ext|
  ext.classpath = File.expand_path("../../lib/gson-2.2.2.jar", __FILE__)
end

require 'rubygems/package_task'
Gem::PackageTask.new(gemspec) do |pkg|
  pkg.need_tar = true
end

