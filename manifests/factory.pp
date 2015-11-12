# == Class elastic_filebeat::config
#
# This class is called from elastic_filebeat for service config.
#
class elastic_filebeat::factory (
  $prospectors                 = {}
){
  
  require '::elastic_filebeat'
  
  validate_hash($prospectors)
  if($prospectors){
    create_resources('elastic_filebeat::prospector', $prospectors)
  }

}