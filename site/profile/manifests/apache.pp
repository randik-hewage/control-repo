class profile::apache () {
  class { '::apache':
    default_vhost     => false,
    default_ssl_vhost => false,
}

$doc_root = "/var/www/${facts['fqdn']}"

apache::vhost { $facts['fqdn']:
  docroot => $doc_root,
  port => 80,
  before => File["${doc_root}/index.html"],
}

file { "${doc_root}/index.html"
  ensure => file,
  content => "This is a test page",
  }  
}
