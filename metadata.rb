name             'jenkins'
maintainer       'Chef Software, Inc.'
maintainer_email 'releng@getchef.com'
license          'Apache 2.0'
description      'Installs and configures Jenkins CI master & slaves'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.1.2'

depends 'apt',   '~> 2.0'
depends 'runit', '~> 1.5'
depends 'yum',   '~> 3.0'

recipe 'jenkins::master', 
  'Installs a Jenkins master'

# == Default attributes
#
# Master Mirror
attribute "jenkins/master/mirror",
  :display_name => "Jenkins Mirror",
  :description =>
    " The mirror to donload the Jenkins war file. This attribute is only used" +
    " in the 'war' installation method." +
    "" +
    "   node.set['jenkins']['master']['mirror'] = 'http://cache.example.com'" +
    "" +
    " Note: this mirror is combined with some 'smart' attributes to build the" +
    " Jenkins war. If you are not using an actual Jenkins mirror, you might be" +
    " more interested in the +source+ attribute, which accepts the full path" +
    " to the war file for downloading.",
  :required => "recommended",
  :default => "http://mirrors.jenkins-ci.org",
  :recipes => [
    "master"
  ]
#
