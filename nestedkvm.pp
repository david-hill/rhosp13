#$compute = hiera('nova_compute_enabled', false)
$computelist = hiera('nova_compute_short_node_names')
$nodename = hiera('nova_compute_short_bootstrap_node_name')

if ( $nodename in $computelist ) {
  kmod::option { 'kvm_intel':
    option => 'nested',
    value => '1',
  }
}
