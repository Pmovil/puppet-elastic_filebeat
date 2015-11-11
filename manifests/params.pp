# == Class elastic_filebeat::params
#
# This class is meant to be called from elastic_filebeat.
# It sets variables according to platform.
#
class elastic_filebeat::params {

  $package_name = 'filebeat'
  $service_name = 'filebeat'

  $conf_dir = '/etc/filebeat'
  $conf_file = "$conf_dir/filebeat.yml"
  $confd_dir = "$conf_dir/conf.d"

  case $::osfamily {
    'Debian': {
      if($::architecture == 'amd64'){
        $package_file = 'https://download.elastic.co/beats/filebeat/filebeat_1.0.0-rc1_amd64.deb'
      } else {
        $package_file = 'https://download.elastic.co/beats/filebeat/filebeat_1.0.0-rc1_i386.deb'
      }
      $provider = 'dpkg'
    }
    'RedHat', 'Amazon': {
      if($::architecture == 'x86_64'){
        $package_file = 'https://download.elastic.co/beats/filebeat/filebeat-1.0.0-rc1-x86_64.rpm'
      } else {
        $package_file = 'https://download.elastic.co/beats/filebeat/filebeat-1.0.0-rc1-i386.rpm'
      }
      $provider = 'rpm'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}


