# ex: syntax=puppet si ts=4 sw=4 et

define ppp::user::chap (
    $username = '',
    $server   = '*',
    $password,
    $address  = '*',
) {
    $_username = $username ? {
        '' => $name,
        default => $username,
    }

    concat::fragment { "chap-secrets-${name}":
        target  => '/etc/ppp/chap-secrets',
        content => template('ppp/user/chap-secret.erb'),
    }
}
