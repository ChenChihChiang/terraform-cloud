resource "godaddy_domain_record" "gd-fancy-domain" {
  domain   = "fancy-domain.com"

  // required if provider key does not belong to customer
  customer = "1234"

  // specify zero or more record blocks
  // a record block allows you to configure A, or NS records with a custom time-to-live value
  // a record block also allow you to configure AAAA, CNAME, TXT, or MX records
  record {
    name = "www"
    type = "CNAME"
    data = "fancy.github.io"
    ttl = 3600
  }

  record {
    name = "@"
    type = "MX"
    data = "aspmx.l.google.com."
    ttl = 600
    priority = 1
  }

  record {
    name      = "@"
    type      = "SRV"
    data      = "host.example.com"
    ttl       = 3600
    service   = "_ldap"
    protocol  = "_tcp"
    port      = 389
  }

  // specify any A records associated with the domain
  addresses   = ["192.168.1.2", "192.168.1.3"]

  // specify any custom nameservers for your domain
  // note: godaddy now requires that the 'custom' nameservers are first supplied through the ui
  nameservers = ["ns7.domains.com", "ns6.domains.com"]
}