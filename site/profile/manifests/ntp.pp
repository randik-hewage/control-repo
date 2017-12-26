class profile::ntp (
  Array[String] $ntp_server_list,
){
  class { '::ntp':
    servers => $ntp_server_list,
}

}
