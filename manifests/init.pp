# ex: syntax=puppet si ts=4 sw=4 et

class ppp (
    $package_name,
    $version,
    $chap_users   = {},
) {
    concat { '/etc/ppp/chap-secrets':
        owner => 'root',
        group => 'root',
        mode  => '0644',
        require => Package['xl2tpd'],
    }

    create_resources(ppp::user::chap, $chap_users)
}
